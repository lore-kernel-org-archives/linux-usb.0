Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8744BC90;
	Mon,  6 Jul 2026 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329345; cv=none; b=LwFHRetRRDn/vJMRUPdpRUt9gaYSePHL8AUPeAboYrbcn7NaL0g0aF55ACzV9Qp0HeOpJ2d9lUV0iO31ljBRuPjt+/Bc2RLrrLi7AToTTNCnEb8lqD09hnBuJ/KcRIy2kik6S9DEntwGXEbZ/pdR29rQf0NjQUzOV7GKFA9tm2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329345; c=relaxed/simple;
	bh=7/RWacTIhre0rBqUd+me5dArdF/10/Ic/Jfye6xibBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qhckOQyL9dFMbzO++Hl4LvLUUYq0iOqvF33dlLbByn7OVlHps3wWRKrg4q87NiVOMdoLSNXaVdYSnjdfrPG7TUANp5wPncfIkXTKTG8fy5svCOzbWMAtaF//jMU9pwtL4SHcIJwpGyXqJ3A4XqcIugt3vquGRuAeQvugM/uXg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAAnxs41cktq0QnxBA--.35176S2;
	Mon, 06 Jul 2026 17:15:33 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Andreas Noever <andreas.noever@gmail.com>
Cc: Pengpeng <pengpeng@iscas.ac.cn>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: validate DROM entry lengths
Date: Mon,  6 Jul 2026 17:15:32 +0800
Message-ID: <20260706091532.77293-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnxs41cktq0QnxBA--.35176S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1DZw4DAw4fZr1UJr1xGrg_yoW8JFykpF
	4Ykryayr48JF4Iqa1Ikw4UZa45ua4Sqay7WFyjgayYvwnFqry8Wa4rJrWj9ry0qFsYkr4a
	qFyDtry8CFy5WFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6v38UUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

From: Pengpeng <pengpeng@iscas.ac.cn>

tb_drom_parse_entries() checks that a DROM entry does not run past the
end of the DROM, but it did not require the declared entry length to
cover the entry header itself.

Require each entry to contain its two-byte header before dispatching to
the type-specific DROM entry parsers.

Signed-off-by: Pengpeng <pengpeng@iscas.ac.cn>
---
 drivers/thunderbolt/eeprom.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 5681c17f82ec..270bb34aff42 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -414,9 +414,15 @@ static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_size)
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
+		if (entry->len < sizeof(*entry) || entry->len > drom_size - pos) {
 			tb_sw_warn(sw, "DROM buffer overrun\n");
 			return -EIO;
 		}
-- 
2.43.0

