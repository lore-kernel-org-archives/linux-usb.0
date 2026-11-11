Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411911;
	b=bymCF0dPkkkgaDGGehhgap0sjG7L6iglLre9MjW1JcnASOY54QY556x9cM/dZ6Nn5DM+
	 L5xr+r/QY7qPNgOBvrNSvB8nbm3xLXAxbHCRz3cC1ZWOpz1FAERgQBW2sj7hjyQF4Wyor
	 or6pQctXkDnCu6n5VOmxhn9inMD37Szm+pEbTJ7iaT8Lz23cVL0cKgCX80Jfqb/Ln/1Bw
	 EwqyPsmjz6kcQ2SXlp4+YPaYZL+dx2cY/eAUjiXwhPQVF7khdoys2j/UdmZL6b4svXwPV
	 BhRBNO62/nEbAlvAvfMMUrYdFn5HIVdRNro47qdv4K02kp/F/9otCVQVt93FKj6TW4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YVhpQdien6ClW81XRhljqG17Ko+dXVxzUCRkvlPhS+s=;
	b=x2HKFzMxZze5HgBUjp3R6p2xBAOksrxrUUkiyEIGxR4SeCveln+D5+L+LZk2INj3/R0S
	 xI7lTzOt60Aw1z7ljQrMNcHg2h2ozwVO+PRG8xUiCp6hTaQTan3UfsRQj2pIV9/1hjUq0
	 3nGZ4YwJ3TOYMm84rkG2TyTA5jLrWG/qYpN2cf3//CH7do9okK3SIbi8fec20RgqU1Rsw
	 s08sRVbs2jv2Z/hwLTVx+OqwaRq8MhGncDu/7tLM+j5S0/ZAlFjgjrsOzI4/yJY4v7xuX
	 3vr3mj6TkvuhWsZMn7eXu72WC2MhiSFVUMxOK3Ro/5U0g3JdWsk9U2DpbYp/99E8BFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7eQiWBs;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620A606A881
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 15:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1620A606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7eQiWBs
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-943e8d35f74so285326185a.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411910; x=1795016710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVhpQdien6ClW81XRhljqG17Ko+dXVxzUCRkvlPhS+s=;
        b=N7eQiWBsJoz1GfZmtmTsNRAJN0A0bODBk5+JYy/c6BAIKZtPkUFoZcR5hLaK99LX8k
         4cgCEbC96C8iztbsYDb5TaCLcBYM+qk5o1DOMTWUEwqJQ6cP9R5xjwcQwD3NbtHOGY+R
         iGFVbU8TTiAQSDckgLgYaudMbdpLrQuoKRHKXqZEdVoWC6Q1P3zZ6Xo8X4/dykwBirEA
         9ypnR8aucL2ziH0x27HJF2utvhazPfgE9y+sCxn//cwWah0NQGhuAUJ2L969gCy/iTGG
         vi0c/MzCQuFwyby+cIIz8Gg59mOaEVwG8R/KSSpknhkS0BN+Y+Bb9AL6mpcP329cScTc
         xXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411910; x=1795016710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVhpQdien6ClW81XRhljqG17Ko+dXVxzUCRkvlPhS+s=;
        b=xxYFTLbyoJ+ZzRmHAa/8twSbjbJoOHqUU4oMlYF5MKdsTmwwm6fKot02m/v8P/4SLF
         jy1eRbDECSzLFDHtELi5PxWqLiiZffqRZ+3KeXkfLowjsHzQxrdV9LeH2zGkreZw2rxi
         cyPkZk8bhwwgE3j+lDx/iFP2UCl5b7EuCJT1VwYsnL5rqYVT7rHZzEpy/pbwBxr1FJC1
         XmMA5cJ+kexRCTdX7Ov0lhCWxrG5mLSChwdaA9KGlRPglaFXCkEhE1IRVwd8I2fjuw8q
         GBG6iM18XZGkO9HOZ/OiwQgDCn+i5BoQPMor/F25elrqstHOWxrdVtm3HhnnSGXxTZix
         a2sw==
X-Gm-Message-State: APuU4Z/ZvzA+++rnsBaYQhf6mQ9ejVxitKpbwOGoOf1DPX4wel9fk89y
	4hymw/qAqPFRBA0qH7wjznzccOmEaE5SVFFb/13v7knfvTreqJ4l5emHXzvO+9pD
X-Gm-Gg: AYBFou3ftgx7dil430KIJdKc0ISaoVDUL/rJYkbW/yjO08YNe+iyp/BHf72wNPKN1Zb
	pi0giCQby0oalLZ9heT+oRxs1Lk6bhkK/0PF8q8njXrBGB3IiCdtFoMSFb84M2+BvDD9V3go7fe
	0qJCbpSkoJQowA0t9Ge1ZTByAiyFtbMc40RuCeb0S/xA9nGQ8bx85tZpCgvdG/Ce1VtMtQf6XJC
	mL0Su4sTMsEnmuDsZqI55+Tqwl/de8Ym5TvG1u4mh+waJq08kNohuGVHV4XP9p6yd70o2ICdrLi
	Omiln/KiX0VtHwXpcDpdZSS+3VEYmD+/LiSVwkgdZTgeCRbpF4SoZ+TguWVCfNtc8mpzMd8WKMz
	NtMjXB0IPukjW/7REo8tldZR9kr05tCGTeeHUp4o+b/zxJcHm7gOqPTAQ8dksuJH9LWYY5rDOoa
	VCb06ygXagFS1rcdj6l38ACgL42G+4G6ZttTUYGHKhSmfRKmwXve6DdCrK0XCtLVGCrBwyW5vQC
	jy91190bFYpqZicgBL+fVPVv74b4EGCi0DL5aHAPnG6pWeU7sEbwpnnJZu0aVNMIoRH335onH3D
	8VrCdTwMEFExSg27/vuYylxznwClSDUaTogUIp8y6f/XuyM91Wue0nwPsp5iQurMM+V3u0nfhrA
	UjMYeVGfL0KSZSnqcwodj
X-Received: by 2002:a05:620a:1a02:b0:945:f275:76fb with SMTP id af79cd13be357-947b002ccbbmr439213085a.42.1794411909629;
        Wed, 11 Nov 2026 07:45:09 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7f2edesm510783885a.40.2026.11.11.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:45:08 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: Check the alternate mode ID allocation
Date: Wed, 11 Nov 2026 10:45:03 -0500
Message-ID: <20261111154503.3621477-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

typec_register_altmode() stores the return value of altmode_id_get()
in an unsigned int without checking it. When ida_alloc() fails, the
error code becomes the ID, and the alternate mode is registered under
a name such as "port0-partner.4294967284". A second failure on the same
partner then fails with a duplicate name:

  [    0.423055] sysfs: cannot create duplicate filename '/devices/platform/altfail/typec/port0/port0-partner/port0-partner.4294967284'

Return the error when the ID allocation fails.

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Cc: stable@vger.kernel.org
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org

v1: https://lore.kernel.org/all/20261111041446.3072716-1-lcy8047@gmail.com/

Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with a test module that registers a port,
a partner and 63 partner alternate modes, and then two more with
failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
this patch, the first of the two is registered as
"port0-partner.4294967284" and the second fails with -EEXIST and the
error above. With it, both return -ENOMEM. Same result in three runs
each.

 drivers/usb/typec/class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..29fb13ca9f28 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
 		       const struct typec_altmode_desc *desc,
 		       const struct device_type *type)
 {
-	unsigned int id = altmode_id_get(parent);
+	int id = altmode_id_get(parent);
 	bool is_port = is_typec_port(parent);
 	struct altmode *alt;
 	int ret;
 
+	if (id < 0)
+		return ERR_PTR(id);
+
 	alt = kzalloc_obj(*alt);
 	if (!alt) {
 		altmode_id_remove(parent, id);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

