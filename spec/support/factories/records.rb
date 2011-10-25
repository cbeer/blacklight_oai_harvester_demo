FactoryGirl.define do
  factory :record do
    content OaiDcDocument.from_xml('<?xml version="1.0"?>
<record>
      <header>
        <identifier>oai:lcoa1.loc.gov:lccn/00528551</identifier>
        <datestamp>2010-12-29T15:56:33Z</datestamp>
        <setSpec>coll</setSpec>
      </header>
      <metadata>
<oai_dc:dc xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/                          http://www.openarchives.org/OAI/2.0/oai_dc.xsd">
<dc:title>African-American sheet music, 1850-1920 selected from the collection of Brown University.</dc:title>
<dc:creator>Library of Congress. National Digital Library Program.</dc:creator>
<dc:subject>African Americans--Music.</dc:subject>
<dc:subject>Minstrel music.</dc:subject>
<dc:subject>United States--History--Civil War, 1861-1865--Songs and music.</dc:subject>
<dc:subject>Popular music--United States.</dc:subject>
<dc:subject>Music--United States--19th century.</dc:subject>
<dc:subject>Music--United States--20th century.</dc:subject>
<dc:subject>sheet music; African-American</dc:subject>
<dc:description>Selected from the Sheet Music Collection at the John Hay Library at Brown University. Consists of 1,305 pieces of American-American sheet music dating from 1850 through 1920. Includes many songs from the heyday of antebellum black face minstrelsy in the 1850s and from the abolitionist movement of the same period. Numerous titles are associated with the novel and the play Uncle Tom\'s Cabin. Civil War period music includes songs about African-American soldiers and the plight of the newly emancipated slave. Post-Civil War music reflects the problems of Reconstruction and the beginnings of urbanization and the northern migration of African Americans. African-American popular composers include James Bland, Ernest Hogan, Bob Cole, James Reese Europe, and Will Marion Cook.</dc:description>
<dc:description>Copyright and other restrictions: Permission to copy in any form or to publish material from the Collection must be obtained from Brown University Library.</dc:description>
<dc:description>Title from home page as viewed on Nov. 9, 1999.</dc:description>
<dc:description>Offered as part of the American Memory online resource compiled by the National Digital Library Program of the Library of Congress.</dc:description>
<dc:description>"LC/Ameritech Award Winner"</dc:description>
<dc:publisher>[Washington, D.C.] : Library of Congress, American Memory</dc:publisher>
<dc:date>1999-</dc:date>
<dc:identifier>http://hdl.loc.gov/loc.gdc/collgdc.gc000019</dc:identifier>
<dc:language>eng</dc:language>
</oai_dc:dc>
      </metadata>
    </record>')  

  end
end

