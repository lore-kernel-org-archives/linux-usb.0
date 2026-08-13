Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBC1484250;
	Thu, 13 Aug 2026 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634644; cv=none; b=tFTnefhlxpVfFTAdZ+MdSJ+h8+/j8Zl2cd4HK3w0/56zN2yDrKAJdkCOOu9uVZTeXXI70RO3A5vwyV31mW0+EsGYvDbvD2uuk9zHUYdhCvftBFyfudPAmG6f/GnnhC1LJmqGg0xiTxJmGO/ZU/7JI7TFT2CccZvsa7h0knQAA1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634644; c=relaxed/simple;
	bh=jZ59/5+j4r6jDhYelZ2dEySjNjts5o2tJRbyT0SVuUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uCIucZcrc7xJRNA9SFLtYDILHMZ+bAI0xYNxnvk6h9vwE6lb3zPr2ha90brwjrSnq3pIclPs/UgMOpgtNr0cciCBlyVi3BqwFY7RLpSXhFLUEtetVx1f1Qjk+XzQ2RDrd4J4IgFbwG2EfK6jljLBJf4Ap+BdujuUo+nrvmVTu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACXa++N4X1qgpV5BQ--.60538S2;
	Thu, 13 Aug 2026 23:23:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 1/2] thunderbolt: require complete DROM entry headers
Date: Thu, 13 Aug 2026 23:23:57 +0800
Message-ID: <20260813152357.32379-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813152206.28059-1-pengpeng@iscas.ac.cn>
References: <20260813152206.28059-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXa++N4X1qgpV5BQ--.60538S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1rXF4fJF4fuw4fJrWxCrg_yoW8Ar17pF
	4fKryUtrs7JFW2ya4fAa1UXay5ua92qay5XFyjgayFv3ZIq348Wa4rKFyj9ryxWrsYkF4a
	qF98tF97CFyUuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSLv
	NUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

tb_drom_parse_entries() checks for one byte remaining before reading a
DROM entry header, but the header occupies two bytes. It also accepts a
declared length of one byte.

A one-byte tail consequently makes the parser read entry->len outside
the DROM. A one-byte generic string entry reaches the subtype parser and
underflows its payload-length calculation.

Require a complete entry header before reading it and require the
declared entry length to cover that header. Use subtraction-based bounds
checks so the firmware-provided length cannot overflow the DROM extent
calculation.

Fixes: cd22e73bdf5e ("thunderbolt: Read port configuration from eeprom.")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/thunderbolt/eeprom.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 2a13fa6888ba..52d654048f07 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -421,9 +421,16 @@ static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_size)
 	int res;
 
 	while (pos < drom_size) {
-		struct tb_drom_entry_header *entry = (void *) (sw->drom + pos);
-		if (pos + 1 == drom_size || pos + entry->len > drom_size
-				|| !entry->len) {
+		struct tb_drom_entry_header *entry;
+
+		if (drom_size - pos < sizeof(*entry)) {
+			tb_sw_warn(sw, "DROM buffer overrun\n");
+			return -EIO;
+		}
+
+		entry = (void *)(sw->drom + pos);
+		if (entry->len < sizeof(*entry) ||
+		    entry->len > drom_size - pos) {
 			tb_sw_warn(sw, "DROM buffer overrun\n");
 			return -EIO;
 		}
-- 
2.50.1 (Apple Git-155)

