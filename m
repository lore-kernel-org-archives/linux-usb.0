Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA9439343
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615671; cv=none; b=sKMeoj/nc89FeUggfTmhSh7+91ZVYJp1kiZpMU5PqCtafaT/iNngTzh0mVPdKqzZc/V9wAiaJtxrTx70VTvAMuIZ16TryU/3qIVIBpc8nimwV26Czy8mt9jqL3uMhl4risyDRGV6j0U5PLtI1LB8dhVTYMpYlNC9Q+9Jro0tF8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615671; c=relaxed/simple;
	bh=CuR5q0hG/ysY6cDljY7+7vdeuayA1M3MknJPwWSlmnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PM92HfLTcQcUF+CB+2d8dHkNMMLHR01YGSliq+XL2JybwVM5fSIKQQlDJCw/9KItxtGG15C1q6c2QUQ0sL5B3/2XHXpPuPuHln8/s+r97Ks5qr1hHB97bT2kZAcX5FdnWZecLecvUF6AlStmuUIQ804AKEXGkB11+mXC+sz3ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbhARNiu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbhARNiu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38511175ad3so8921670a91.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 23:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784615666; x=1785220466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qpio1MA//9AANLCzTxy+rZBs26K9YsY9hJV884pqdVI=;
        b=QbhARNiuqzABgVH5uyyQxIQ6PqIS2awdcowz7+cYZWFgLmQCMzKDQUg+QLptRpDDF9
         /F5s7QE88eK8nGgCs5LYEvSo3VCotaBu2q3TbsmErsIveUeOLHlOf2jz+1EwT+ebalD7
         8+jMhAJmnNfsmfHUng1HKScAIFjh4Imis6WNztTjzXcRTrdYfGMSJoHTFFCgefrBMuDr
         UnshuyjcvR10IEWyAWYHSOwD44aCLOjD/ky8zhfC/PKAQScSB1auM23jaj/rBEGNkq1b
         F4NbJHTr/RO8x5VN54YJOtpJjRha/MvSqmSwbe6aM0SdpAoamurIJSXaqygvi/ca8y4J
         r4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615666; x=1785220466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qpio1MA//9AANLCzTxy+rZBs26K9YsY9hJV884pqdVI=;
        b=Dw0tCEWWYORM7W9VuCgS852zFdjv0yQdnXDZ3tyE4/R77M5goBVhgOUUMDwLA5pnvC
         FLe+IdKu+jGYRJDV4GEP+d1AjKNAhKc3wb0dIKnOmMcCxZr+eAzrPdyNOvBa/VxMEPxk
         9vPgLlpWZGx4fEIA8l9Stu/oV9zV8Dlnx/LaYLcYLXVnVqXVQA8n1borkvslwMuMyw/6
         7/uUoZLq3aTXlXlchd4nf300P8rHKmKf/Coal/L6ioGHgDlSK+7yXmFkH/RBNzn1Oy5j
         aoHAvSabApp9gcSbtdmVLsS7LaKk0K6MdRQml/Uhp/3c9Y00pCI2ogfE691gU4GFobeM
         +W5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqZM9hQO5KqZ7Q+XG26QQoyvXSCVg0XLmFTGd1YsRHUmUoS+7S/dSLw/lWSoeXaLSZIZ+yGVnNEAgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJborm5ROeytgwSdNcaf4UEy+MIJu94X+Opqb2uKG0tWnMvK7
	fci7C8Oo0oBWSqPD3j74tM5gcIFZ6Sxv2WI7+bAQHrGjpzxDPAs6kqg=
X-Gm-Gg: AR+sD13E1HKR/a31PvMajhjVFN4joSCVUSBEbPGOfAgcFKvGoW03PN7oUauI88iZFTF
	93FncjPc0twC+l03CQl2g3d3wXDqC8cOr5o8ReRn5to3sfEJjLP4OWbDeFQq86kZhRZ72X6BZ2B
	0ZYni/Ab3q0ZWD8oNBeGGgIW90HK+cKxbpmbU4Eh4zsN/yPIkSdRZhrPe4bjIwf/DofyfGfUyWi
	4v8Gxr2FLw14PJXatf0xn5GvC1csH5Ijrhf7pcsW+P18OT0cnqMYIe70AiwgBVWJBEwbwdw2GaS
	mQjALopRKKihN8xJ7DS0c6D3VthDXGb0r5NkSk61rRzCBtZoZN7DkjMOPvB4bToZbgkDeZ0pWik
	IF2VRcRM2F2L7t52RbezKYbN4ocpvc1+Pcga3LwUsjxI/vVWaRZbNhdpgmPH2yQz5qPuNa1gWbE
	shZBX6ATSsbNehIqEZtNum4qZ7SSCQAUGVo/S3r3WvlLZhdn3b
X-Received: by 2002:a17:902:ce87:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2cf34895290mr177684225ad.7.1784615665937;
        Mon, 20 Jul 2026 23:34:25 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.60.20.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm73608386eec.21.2026.07.20.23.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:34:25 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v3 0/2] Add Apple T2 NHI device links
Date: Tue, 21 Jul 2026 02:34:05 -0400
Message-ID: <20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a cached flag to detect Apple T2 systems, then uses it
to create device links for the Thunderbolt NHI.

Changes in v3:
- Fix build errors with non-x86 machines
- Used __initconst for apple_t2_devices
- Removed UEFI_QUIRK_SKIP_CERT as its unused now
- Used IS_ENABLED(CONFIG_ACPI) in tb_apple_add_links for the T2 part
- Removed !bid check to remove warning with -Waddress

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  treewide: Add a flag to detect the Apple T2 chip
  thunderbolt: Add device links for Apple T2 NHI

 arch/x86/kernel/quirks.c                      | 105 ++++++++++++++++++
 drivers/thunderbolt/tb.c                      |  51 ++++++++-
 include/linux/platform_data/x86/apple.h       |   5 +
 .../platform_certs/keyring_handler.h          |   8 --
 security/integrity/platform_certs/load_uefi.c |  38 ++-----
 5 files changed, 168 insertions(+), 39 deletions(-)

-- 
2.43.0

