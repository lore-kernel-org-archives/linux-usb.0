Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853256;
	b=Vv+BP7/G2K+xR4BbWNyapSm4+GBkR0o6EA5EkJX/kYOwGFAOyojyzmOmPiuFOm52ZN8M
	 AlyW89RzAO8Rmf/Dy1QzylkXWvTpO57H5uFJPqdDwU/MxMJBBCkW1SOe7nf0OSxPtPAiJ
	 3Ed+QnR297rDECdO8P6RZerY66LNLDblebYX+kGwiV9y+m+TKPBTZtgIyyxFH9U6lAkrV
	 fkDav0kc/M1yMMFDcVin3pcgAxSl9H39iGdJ6hZfmWcGYS+6NsJxIuubaQcN25t9M7GXs
	 eZQXdWqtSFhPp5/lxiBKenU1jY56/cR/X4Eep6l63EVHHSYtX8zlHXtrj5ym/ceA8Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853256;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3pyHOCd7l2P6yeKjjzPj2V6+w4++yAlBV9wM0KG0J/o=;
	b=e7AJNvwXC0V57aUC1ZmqoGv9FLQ9gQssdsgPH2IWcaA2uxPGYDrfWYhinoaETwtgL4o+
	 Up92tWboE+FkGbw+EhKWQ7CrRHYjzQPjusvLtz1io+UVFm+yaYryq9eMFKE3vw34LyOEn
	 VjPY33+f/2foxC3ZXPmbvefCZOsh5PuNijtAt4rgEnlovRZuihkic+czAGVfBaKn5vhoz
	 r3vW7VpdUydvF+u1QCLqSG4qpuVCaLD4nc00O1tJXkFN98LZGkUvjzQvxWEu0svSJVptO
	 NTlnph2SSiUIOAGL6qew+sez+OHpCAPkUUA0A+VAlyN7opvu6e0b1Gq+/i4Ve2fZLdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=fdQx6029;
	arc=none smtp.remote-ip=115.124.28.5
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C103606A31F;
	Sat, 28 Nov 2026 08:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C103606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=fdQx6029
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1795853246; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=3pyHOCd7l2P6yeKjjzPj2V6+w4++yAlBV9wM0KG0J/o=;
	b=fdQx6029wblSVeTGs2ly8dQm1uy+iYApJjqhpsdcMTeajYsloaBAaOIrS1t/SAzSyL2aesbFXXC+RBQe3tMclr9pz2NLbEsienzz3dtA1ECebnr0qw3GWA1tJN+SJtgZzlFKggT5ai2FAkSiXCjXzZw52+WRufyTd4vf6cCBHKI=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00415204-3.12034e-05-0.995817;FP=18041251421778642104|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045139068;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.kC0FY3m_1795853244;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.kC0FY3m_1795853244 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 28 Nov 2026 16:07:24 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	khtsai@google.com,
	fangxy@xiaopeng.com,
	Randy Dunlap <rdunlap@infradead.org>,
	dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v6 1/2] lib/net_utils: allow mac_pton() to take a custom delimiter
Date: Sat, 28 Nov 2026 16:07:14 +0800
Message-ID: <20261128080722.1469508-2-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261128080722.1469508-1-liuc63@xiaopeng.com>
References: <20261128080722.1469508-1-liuc63@xiaopeng.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mac_pton() hardcodes ':' as the only accepted separator, which pushes
callers that need a different notation to open-code their own parser.

Split the body out into parse_mac_pton() taking the set of accepted
delimiters as a string, and turn mac_pton() into a static inline wrapper
passing ":" so that every existing caller keeps its current behaviour.
The strnlen() guard still runs before any delimiter is inspected, so
strchr() is never handed a NUL character.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v6: no change.
v5: reword the parse_mac_pton() kernel-doc to say @s must be at least
    MAC_ADDR_STR_LEN characters long and that only the first
    MAC_ADDR_STR_LEN characters are checked, the rest ignored.  No code
    change.
v4: no change.
v3: pick up Andy's Reviewed-by, no code change.
v2: new patch, split out of the u_ether fix at Andy's suggestion.
Link: https://lore.kernel.org/all/20261117090110.3263592-2-liuc63@xiaopeng.com/

 include/linux/hex.h |  7 ++++++-
 lib/net_utils.c     | 19 ++++++++++++++++---
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/linux/hex.h b/include/linux/hex.h
index 2618382e5b0c..408825478cda 100644
--- a/include/linux/hex.h
+++ b/include/linux/hex.h
@@ -30,6 +30,11 @@ extern int hex_to_bin(unsigned char ch);
 extern int __must_check hex2bin(u8 *dst, const char *src, size_t count);
 extern char *bin2hex(char *dst, const void *src, size_t count);
 
-bool mac_pton(const char *s, u8 *mac);
+bool parse_mac_pton(const char *s, u8 *mac, const char *delim);
+
+static inline bool mac_pton(const char *s, u8 *mac)
+{
+	return parse_mac_pton(s, mac, ":");
+}
 
 #endif
diff --git a/lib/net_utils.c b/lib/net_utils.c
index 215cda672fee..fd76b9ab3f24 100644
--- a/lib/net_utils.c
+++ b/lib/net_utils.c
@@ -5,7 +5,20 @@
 #include <linux/export.h>
 #include <linux/hex.h>
 
-bool mac_pton(const char *s, u8 *mac)
+/**
+ * parse_mac_pton - convert a MAC address string using a custom delimiter
+ * @s: string to be parsed
+ * @mac: buffer to store the result, left untouched if @s is malformed
+ * @delim: characters accepted as a separator between the byte pairs
+ *
+ * @s must be at least MAC_ADDR_STR_LEN characters long and use a character
+ * from @delim at every separator position, e.g. "aa.bb:cc.dd:ee.ff" with
+ * ".:".  Only the first MAC_ADDR_STR_LEN characters are checked; anything
+ * after them is ignored.
+ *
+ * Return: true on success, false if @s is malformed.
+ */
+bool parse_mac_pton(const char *s, u8 *mac, const char *delim)
 {
 	int i;
 
@@ -16,7 +29,7 @@ bool mac_pton(const char *s, u8 *mac)
 	for (i = 0; i < ETH_ALEN; i++) {
 		if (!isxdigit(s[i * 3]) || !isxdigit(s[i * 3 + 1]))
 			return false;
-		if (i != ETH_ALEN - 1 && s[i * 3 + 2] != ':')
+		if (i != ETH_ALEN - 1 && !strchr(delim, s[i * 3 + 2]))
 			return false;
 	}
 	for (i = 0; i < ETH_ALEN; i++) {
@@ -24,4 +37,4 @@ bool mac_pton(const char *s, u8 *mac)
 	}
 	return true;
 }
-EXPORT_SYMBOL(mac_pton);
+EXPORT_SYMBOL(parse_mac_pton);
-- 
2.50.1

