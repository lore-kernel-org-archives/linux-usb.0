Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6A3212550
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 01:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916097; cv=none; b=LA6aiKlEXdsZF1RTNAc97DV5l1rQZgRZVdgLAnzISvufNLabL5iUNam/um1YaPKk4/Nli3qe5m5dgrEtdyNww8I0wT7wbz54ygoCA3R2K2+mni6gJhd1jaITCF4v6PlMPGdCGTfElbUoKTz9HTK1xf45IIAfMmQ8Qvg1vJSeaR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916097; c=relaxed/simple;
	bh=o5vDWEBXBvQGT+uOAUaMfiCv44D9Ll5+4DYhNLBjOUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Onv34OjBvkLvBEFR3S2ISbo4C4nLdommOTt0R7YcVPWhEFANThgUvnAddvFV9httim8puYoBu07XyoWZkJUVOE65NCVK9CHvK18t6FhEq0EcbJ6sSIfR2C4enYgP4UyRfasMHlB4ldMoIq+wOm+xPCuJzLVz2uidXRagH9ily4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnT/c1FK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnT/c1FK"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca12086c06eso4047679a12.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 18:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788916096; x=1789520896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSr+aJCl9Nbo53QwUJBq5S+WfBghs3WzUC0GUb18194=;
        b=TnT/c1FKbUwmyjUONhDNojnSrpH+KVzLMIAWcrMtbTcXtJ72Ur02BNzNJ3cBCvdQvP
         gBNtCxlTz23SSMkNDfgTRtj6OzzQiRU8OX/SFvSpzOIAvhA5UqXvloSnD/5bZpSBo5dh
         OKMFTGaC6rTKGdlZIvM+Fp06fyzzPvZqgnfeluCwTAB5/SMDk9UUZRxyBdhOV8xRbG7v
         y5dKC957Qw2UMBz+8nEFYvtPK0NZ+0ePqAs8rg2zQJvvDb9Wt1G//2aFoufOARuLbREs
         J13ZStHQ0huRWcy/m9428iF41yHVM52GIszQevtG9oj+c6KDrz9GjlzB9Daop8NAM0fQ
         FHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916096; x=1789520896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSr+aJCl9Nbo53QwUJBq5S+WfBghs3WzUC0GUb18194=;
        b=T27OcWJtIsmjuJqKlmmQLkoCr+o78e3cg7riFUzdDlx4/vKsKZuLpc8MyT/xG7n3Wm
         fDpBTo/Vn/DjF6IZPADLtba4VffHUqRgzHnPDU8fOMQNOf6emhmpXng/5fhhly1eqzZb
         pzhJlwxB/SKjtUX1OJi1Z0WjDS1oEAf2ttT6uOGqkM1iAr0ipkvvJpB2SDzVtVDPFDxm
         AVIIWbRPjYe+PSUmgL+ZkWUqqjloPq3Ro+A/qakAx1fGne4IrGjTgBp5nWjEFbwYMHaS
         Wq6+wNCk1zC+hGUuSlydhEQoKvNH9L8iKIlZjOpAzre6wFAO/rSJTQX7vfun4eGjLw9V
         HCQQ==
X-Forwarded-Encrypted: i=1; AKwUvBySYFIzPskQ9y3QtsnWOgJ0tlrIoOy3sf8QcWpMx628VD+wSO4Ugn2y2QrU2m2o9sTUw2uxKOjwH9c=@vger.kernel.org
X-Gm-Message-State: AFuF++nN088cPAso2YtLYEFMl83gGijZlVrOCJXRvRBwAmy7SfEx47q/
	reA2XC1c86lSdPVrBgZ4pNB1+vTws8rEbfd5DhImU+OSX0rs4LRdCu6F/r/GQg==
X-Gm-Gg: AYBFou1Pl2ufy/XmwjUOWoKSBYxwb5bWQwdqzaKP+qXdCShW53kAxmP4ZnhUXtJDz3T
	K1Xknm+yh4KDq6Sh/eI/xeiIcM2OV5XHsZF0xH9uadIb0QHqZJNkgzspfeagIHsPjDu/xKcmA7V
	VTXNaAhFSRK6Pmf+LZLD0iROUzrL1HQYSwVaOB2AFiuRwg5uEKsR2hhGqmE6StjHI/Rau74d/1+
	KxS40b1ZVyuLwqOXrzuCRJvoNXZEEeDzn17Ftd+FERSUBKq4KVvQfSRG/o1O8Tl5JBVdfVKKb5m
	3np20BMeizhrSF22F0kKOHdtVCAg4ms5UJ1CdwGU+yn+zEbPgsWsmgwLzVFBueqWk6jQ0VhAQkq
	0pOO2LYQu6VOowqRWXZt5LoC70t/2tCVTnEsaCzzSZ65eV+qhUkWXb2u9jNV17QBmlAgk7D+g01
	Q4MMcfpNhqrRLEbH1/56SBLSax4bpdg6ENoU3GIiVX/EdSNyRPYvv6I3LfzwUJjBcCJY7PO29ZD
	Dp4PJAQ480=
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39b260fead0mr47303688a91.1.1788916095795;
        Tue, 08 Sep 2026 18:08:15 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm34696115a91.7.2026.09.08.18.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:08:15 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: Reject oversized XDomain properties responses
Date: Wed,  9 Sep 2026 10:07:37 +0900
Message-ID: <20260909010737.1883610-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tb_xdp_properties_request() allocates room for 45 data dwords in its
252-byte response buffer.  The XDomain length field is six bits wide,
however, and a malicious peer can set it to 63.  After the fixed response
fields are subtracted, the driver treats this as 48 data dwords.

Commit 322e93448d90 ("thunderbolt: Clamp XDomain response data copy to
allocation size") only bounds the copy against data_len.  If data_len is
at least 48, memcpy() reads 192 bytes from the 180-byte res->data array,
causing a 12-byte heap out-of-bounds read.  Commit 4db2bd2ed478
("thunderbolt: Limit XDomain response copy to actual frame size") limits
the earlier copy but does not constrain this header-derived length.

Reject response data lengths that exceed the allocated source buffer
before copying them into the assembled property block.

Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
A private synthetic KUnit reproducer is available to the individual
maintainers on request. It observed adjacent memory copied on 3/3 fresh
boots; the fixed control passed on 3/3 fresh boots. Physical Thunderbolt
peer injection was not available and was not tested.

Tested on current mainline 893e11787f78:
- allmodconfig W=1 drivers/thunderbolt/xdomain.o build
- strict checkpatch
- clean git am with matching result tree and patch-id
- clean apply to current linux-next, Thunderbolt next, v7.2,
  v6.12.105, and hardened-v1-7.2-rc5

 drivers/thunderbolt/xdomain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index c179bd751fe42..0e1e6d90a977f 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -377,6 +377,10 @@ static int tb_xdp_properties_request(struct tb_ctl *ctl, u64 route,
 
 		len += sizeof(res->hdr.xd_hdr) / 4;
 		len -= sizeof(*res) / 4;
+		if (len > TB_XDP_PROPERTIES_MAX_DATA_LENGTH) {
+			ret = -EINVAL;
+			goto err;
+		}
 
 		if (res->offset != req.offset) {
 			ret = -EINVAL;

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
