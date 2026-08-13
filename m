Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3493E5A31;
	Thu, 13 Aug 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634759; cv=none; b=BVQ6aOSZ7lpjeyNr0V1qsiCwls1oQOndOV2hbrnozV4W9wUHaeca/9gDNQgxlQ5f3fLsA5ca7XV4TT7T7ob9HSsMvh1jCl8RXgScvg1TP89ctl6SFNAsEgG7t7rHmMi3wR0Qrof1s9z3vuPdC5jp/prIyNwYaVIoj1mkkQgDxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634759; c=relaxed/simple;
	bh=rFwRNiXxFOJOhLzpDNe95A4QTdW5de0nXXAL36yL3jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dL+dIXOO3dbwjRMhV76iEqhVFU8TYVVuYEW7XNrl+nLJoRtp3AE60cKfgnGa5pl41VsivtJ4VhfWTngS7hCwoVc+zUDsLkLP8N1JrZ4jLXSiHkj3GEr2gUYphFrfUZPgNeTx2NUz5b1h4+zZq9NvFizTYmLl1Nklk19zEQWU+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAH3fD_4X1qYal5BQ--.42965S2;
	Thu, 13 Aug 2026 23:25:52 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 2/2] thunderbolt: validate USB4 product descriptor entry size
Date: Thu, 13 Aug 2026 23:25:51 +0800
Message-ID: <20260813152551.34846-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAAH3fD_4X1qYal5BQ--.42965S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy5WFWkAr1DtF1DJr45trb_yoW8JF4fpa
	yUK3y5tr1DtF4Ivay8tw48ZayY9a13Cay3AFyjg3yYv3Wft34rGayfAFWUXryrG34xKF47
	tF1vy34xCFy7ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The USB4 product descriptor parser casts a generic DROM entry to
struct tb_drom_entry_desc and reads its vendor and product identifiers
without requiring the entry to contain that structure.

A descriptor whose declared length covers only the generic entry header
therefore makes those field reads cross the entry boundary. Require the
entry to contain the descriptor structure before accessing it.

Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/thunderbolt/eeprom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 52d654048f07..6b83232b6bf4 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -348,6 +348,11 @@ static int tb_drom_parse_entry_generic(struct tb_switch *sw,
 		const struct tb_drom_entry_desc *desc =
 			(const struct tb_drom_entry_desc *)entry;
 
+		if (header->len < sizeof(*desc)) {
+			tb_sw_warn(sw, "USB4 product descriptor entry is too short\n");
+			return -EIO;
+		}
+
 		if (!sw->vendor && !sw->device) {
 			sw->vendor = desc->idVendor;
 			sw->device = desc->idProduct;
-- 
2.50.1 (Apple Git-155)

