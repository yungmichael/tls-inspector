import UIKit
import CertificateKit

class CertificateTableViewController: UITableViewController {
    var certificate: CKCertificate!
    var sections: [TableViewSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildTable()
    }

    func buildTable() {
        guard let certificate = CERTIFICATE_CHAIN?.certificates[CURRENT_CERTIFICATE] else {
            return
        }

        self.sections = []
        self.certificate = certificate
        self.title = self.certificate.summary

        if let subjectSection = makeNameSection(name: self.certificate.subject) {
            subjectSection.title = lang(key: "Subject")
            self.sections.append(subjectSection)
        }

        if let issuerSection = makeNameSection(name: self.certificate.issuer) {
            issuerSection.title = lang(key: "Issuer")
            self.sections.append(issuerSection)
        }

        if let validityPeriodSection = makeValidityPeriodSection() {
            self.sections.append(validityPeriodSection)
        }

        if let keyUsageSection = makeKeyUsageSection() {
            self.sections.append(keyUsageSection)
        }

        if let featureSection = makeFeatureSection() {
            self.sections.append(featureSection)
        }

        if let publicKeySection = makePublicKeySection() {
            self.sections.append(publicKeySection)
        }

        if let fingerprintsSection = makeFingerprintsSection() {
            self.sections.append(fingerprintsSection)
        }

        if let metadataSection = makeMetadataSection() {
            self.sections.append(metadataSection)
        }

        if let subjectAltNameSection = makeSubjectAltNameSection() {
            self.sections.append(subjectAltNameSection)
        }

        self.tableView.reloadData()
    }

    func makeNameSection(name: CKNameObject) -> TableViewSection? {
        let section = TableViewSection()
        for cn in name.commonNames {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::CN"),
                                                              value: cn,
                                                              useFixedWidthFont: false))
        }
        for country in name.countryCodes {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::C"),
                                                              value: lang(key: "Country::" + country),
                                                              useFixedWidthFont: false))
        }
        for locale in name.states {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::L"),
                                                              value: locale,
                                                              useFixedWidthFont: false))
        }
        for state in name.cities {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::S"),
                                                              value: state,
                                                              useFixedWidthFont: false))
        }
        for org in name.organizations {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::O"),
                                                              value: org,
                                                              useFixedWidthFont: false))
        }
        for ou in name.organizationalUnits {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::OU"),
                                                              value: ou,
                                                              useFixedWidthFont: false))
        }
        for email in name.emailAddresses {
            section.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Subject::E"),
                                                              value: email,
                                                              useFixedWidthFont: false))
        }
        return section
    }

    func makeValidityPeriodSection() -> TableViewSection? {
        let validitySection = TableViewSection()
        validitySection.title = lang(key: "Validity Period")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"

        guard let notBefore = self.certificate.notBefore else {
            return nil
        }
        guard let notAfter = self.certificate.notAfter else {
            return nil
        }

        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "Detail") {
            cell.detailTextLabel?.text = formatter.string(from: notBefore)
            cell.textLabel?.text = lang(key: "Not Before")
            validitySection.cells.append(cell)
        }
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "Detail") {
            cell.detailTextLabel?.text = formatter.string(from: notAfter)
            cell.textLabel?.text = lang(key: "Not After")
            validitySection.cells.append(cell)
        }

        return validitySection
    }

    func makeKeyUsageSection() -> TableViewSection? {
        let usageSection = TableViewSection()
        usageSection.title = lang(key: "Key Usage")

        var keyUsage: [String] = []
        var extKeyUsage: [String] = []
        for usage in self.certificate.keyUsage ?? [] {
            keyUsage.append(lang(key: "keyUsage::" + usage))
        }
        for usage in self.certificate.extendedKeyUsage ?? [] {
            extKeyUsage.append(lang(key: "keyUsage::" + usage))
        }

        if keyUsage.count == 0 && extKeyUsage.count == 0 {
            return nil
        }

        if keyUsage.count > 0 {
            usageSection.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Basic"),
                                                                   value: keyUsage.joined(separator: ", ")))
        }
        if extKeyUsage.count > 0 {
            usageSection.cells.append(TitleValueTableViewCell.Cell(title: lang(key: "Extended"),
                                                                   value: extKeyUsage.joined(separator: ", ")))
        }

        return usageSection
    }

    func makeFeatureSection() -> TableViewSection? {
        let featureSection = TableViewSection()
        featureSection.title = lang(key: "Features")

        guard let features = self.certificate.tlsFeatures else {
            return nil
        }

        for feature in features {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Basic") else {
                continue
            }
            cell.textLabel?.text = lang(key: feature)
            featureSection.cells.append(cell)
        }

        if featureSection.cells.count == 0 {
            return nil
        }

        return featureSection
    }

    func makeFingerprintsSection() -> TableViewSection? {
        let fingerprintsSection = TableViewSection()
        fingerprintsSection.title = lang(key: "Fingerprints")

        if UserOptions.showFingerprintMD5, let md5 = self.certificate.md5Fingerprint {
            fingerprintsSection.cells.append(TitleValueTableViewCell.Cell(title: "MD5",
                                                                          value: md5,
                                                                          useFixedWidthFont: true))
        }
        if UserOptions.showFingerprintSHA128, let s128 = self.certificate.sha1Fingerprint {
            fingerprintsSection.cells.append(TitleValueTableViewCell.Cell(title: "SHA-128",
                                                                          value: s128,
                                                                          useFixedWidthFont: true))
        }
        if UserOptions.showFingerprintSHA256, let s256 = self.certificate.sha256Fingerprint {
            fingerprintsSection.cells.append(TitleValueTableViewCell.Cell(title: "SHA-258",
                                                                          value: s256,
                                                                          useFixedWidthFont: true))
        }
        if UserOptions.showFingerprintSHA512, let s512 = self.certificate.sha512Fingerprint {
            fingerprintsSection.cells.append(TitleValueTableViewCell.Cell(title: "SHA-512",
                                                                          value: s512,
                                                                          useFixedWidthFont: true))
        }

        if fingerprintsSection.cells.count == 0 {
            return nil
        }
        return fingerprintsSection
    }

    func makePublicKeySection() -> TableViewSection? {
        let pubKeySection = TableViewSection()
        pubKeySection.title = lang(key: "Public Key")

        guard let publicKey = self.certificate.publicKey else {
            return nil
        }

        guard let algorithmCell = self.tableView.dequeueReusableCell(withIdentifier: "Detail") else {
            return nil
        }
        algorithmCell.textLabel?.text = lang(key: "Algoritm")
        algorithmCell.detailTextLabel?.text = lang(key: "KeyAlgorithm::" + publicKey.algroithm)
        pubKeySection.cells.append(algorithmCell)

        guard let signatureCell = self.tableView.dequeueReusableCell(withIdentifier: "Detail") else {
            return nil
        }
        signatureCell.textLabel?.text = lang(key: "Signature")
        let key = "CertAlgorithm::" + (self.certificate.signatureAlgorithm ?? "Unknown")
        signatureCell.detailTextLabel?.text = lang(key: key)
        pubKeySection.cells.append(signatureCell)

        guard let sizeCell = self.tableView.dequeueReusableCell(withIdentifier: "Detail") else {
            return nil
        }
        sizeCell.textLabel?.text = lang(key: "Size")
        sizeCell.detailTextLabel?.text = String.init(format: "%ld", publicKey.bitLength)
        pubKeySection.cells.append(sizeCell)

        return pubKeySection
    }

    func makeMetadataSection() -> TableViewSection? {
        let metadataSection = TableViewSection()
        metadataSection.title = lang(key: "Metadata")

        if let serial = self.certificate.serialNumber {
            metadataSection.cells.append(TitleValueTableViewCell.Cell(title: "Serial Number",
                                                                      value: serial,
                                                                      useFixedWidthFont: true))
        }

        if let version = self.certificate.version {
            guard let versionCell = self.tableView.dequeueReusableCell(withIdentifier: "Detail") else {
                return nil
            }
            versionCell.textLabel?.text = lang(key: "Version")
            versionCell.detailTextLabel?.text = version.stringValue
            metadataSection.cells.append(versionCell)
        }

        if metadataSection.cells.count == 0 {
            return nil
        }
        return metadataSection
    }

    func makeSubjectAltNameSection() -> TableViewSection? {
        let sanSection = TableViewSection()
        sanSection.title = lang(key: "Subject Alternate Names")
        sanSection.tag = 1

        guard let alternateNames = self.certificate.alternateNames else {
            return nil
        }
        if alternateNames.count == 0 {
            return nil
        }
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "Count") else {
            return nil
        }
        guard let label = cell.viewWithTag(1) as? UILabel else {
            return nil
        }
        guard let count = cell.viewWithTag(2) as? UILabel else {
            return nil
        }
        label.text = lang(key: "View All")
        count.text = String.init(format: "%ld", alternateNames.count)
        sanSection.cells.append(cell)

        return sanSection
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].cells.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footer
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.sections[indexPath.section].cells[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.sections[indexPath.section]
        if section.tag == 1 {
            self.performSegue(withIdentifier: "SANSUNDERTALE", sender: nil)
        }
    }
}