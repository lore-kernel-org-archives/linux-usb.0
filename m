Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAB7305698;
	Fri, 31 Jul 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507660; cv=none; b=Tc4qUG2Q0rVOSWFQ7FPktg3fth1eZ4WcUkH1q3d1MRYOjGG8EhRk6nun6Z/l5DqMbEtzC6KPiu879lUa7Fgbxk/uYmFuhxZz/Yc9Z7M227IUjdhZNB9ORSMA6UX4nlp8m5k7k6GyS0FVAhlyHRi7lNCH7pAuOSiY3zbqSh5ttUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507660; c=relaxed/simple;
	bh=vYR+Z65JnZ5ygT24697uVWN1I+53H8Aj868IuDKrleE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ru45MvxKWOtNwQTqpCQLAm9I2vGy+dtun01lZEnAq0J+c1UFfnhtIgkOPGIEmf44vuH99dKRkyqxTktSdk8iRuxTDD9eu9khUccvowV6c9OJlhcZihRdnMzhLZOvKZzeoM0iNrnTsQh14W/wBO7pu0Te3Dw1A7l9j5YIv8lZ2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowABnbjxGr2xqJidKAg--.45370S2;
	Fri, 31 Jul 2026 22:20:54 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Andreas Noever <andreas.noever@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] thunderbolt: validate DROM entry lengths
Date: Fri, 31 Jul 2026 22:20:54 +0800
Message-ID: <20260731141700.3-thunderbolt-v2-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnbjxGr2xqJidKAg--.45370S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4UArWUZr4DuF4DKr1kAFb_yoW8trWDpF
	4jk345tr48JF42q34xCw4UXay5uayfKay5XFyjg3yFqrsxKry8Wa4rAryj9ryIyFZYkr43
	JF4Dt34xCFy7ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDpnQUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

tb_drom_parse_entries() checks that a DROM entry does not run past the
end of the DROM, but it does not require the declared entry length to
cover the entry header itself. A one-byte generic string entry therefore
makes the payload length calculation underflow.

Require each entry to contain its two-byte header before dispatching to
the type-specific DROM entry parsers. Also require a USB4 product
descriptor entry to contain the vendor and product fields read by its
parser.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260706091532.77293-1-pengpeng@iscas.ac.cn/
- use the full author name in From and Signed-off-by as requested by
  Mika Westerberg
- validate the fields read from USB4 product descriptor entries
- rebase onto the current tree

 drivers/thunderbolt/eeprom.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 5681c17f82ec..87ae1b8d7c82 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -348,6 +348,12 @@ static int tb_drom_parse_entry_generic(struct tb_switch *sw,
 		const struct tb_drom_entry_desc *desc =
 			(const struct tb_drom_entry_desc *)entry;
 
+		/* Header, USB spec, vendor ID, and product ID. */
+		if (header->len < sizeof(*header) + 3 * sizeof(u16)) {
+			tb_sw_warn(sw, "USB4 product descriptor entry is too short\n");
+			return -EIO;
+		}
+
 		if (!sw->vendor && !sw->device) {
 			sw->vendor = desc->idVendor;
 			sw->device = desc->idProduct;
@@ -414,9 +420,16 @@ static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_size)
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
2.50.1

