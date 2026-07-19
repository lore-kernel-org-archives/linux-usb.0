Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161793B19D9
	for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484233; cv=none; b=JWQ7tV+m0m2msNUV9Qki2Ab6DKA66sXM1DhKdLYTojMRV4YrKhkRHJ0lHUVx4lQFeQKKm0jp00utLoKD1HG8kL025yquphJv+AS2eXw7ql26mO/6VxNmuRK4/LBdd0kRi+2VfwVDggF0iVpN/zllhydsnDQnjrkvpCyg0UnfW64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484233; c=relaxed/simple;
	bh=sVlAnhzfkzYQa1PcZYfpNzgJJd87BozZZNakBNALqlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHvQbeks/3YgFXkzP8BDObEvp8XAYcSG8+quQfOlRwV5BSE3nwOpguhR36ah13O2zanb2d5vdeYYiacWLRhCtDadfveL6E/YpbWniPJU/XZZUGexKd+S+Wim5NMAFYFS3hhR4nMpwAvmmNGfM6Zi3BxZo/Xjd+sQ8/Bg5he78to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO41oVYo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO41oVYo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cca0c5799eso69598695ad.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484226; x=1785089026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxozXjIKJbQZrZVReseOqoF/OLImpOhluGTGzSR1yOE=;
        b=VO41oVYojY5nNLDlQiMn6nnfXahXoClP/cwC9XHBUJf/aNsn76YDQYHUlyO81zd557
         YvWIt5o0EWh+URbiaqycX6C7b4JQt/Jkzlwh8vd7xrZXTmKfEfuwHMSGnTkXrDaN7FE2
         jSZFoJRDwcnJip5qO88NGfDWikr7Cx+J5uULPkgBrEJWj6uiMOdjQ6rzsYZ/1KKRU7RC
         1BVYN7Zxn4jAfRXOB8M5vEabMD6GvZgJYYREyQE5nBg4nf/rgZZkgSgCRUcqXBJbJHhl
         49JfSkQ30IgEDQQ63i5kq6otw8ArRObpqTIcFtA6nlbIUih6FG2u+71BRPxJlAbaoVwW
         aAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484226; x=1785089026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxozXjIKJbQZrZVReseOqoF/OLImpOhluGTGzSR1yOE=;
        b=GPorqkLqsFzKGgmWIr++WFUVWA56XFoMJRquoE9gebRaA9O8YtjgsJrrFvWzMB81Uf
         3rxaIPAnkcYQf1iwNoJXaE6b9hWXpdJausMTunwwKY++cxxAjuqAsw/7LMmUazaJbP7e
         7hdI6DhKDfuGBby+XiKaewpLakYOZYDVEo/T4MIat5ELxxndTO7KGSqha84w4DS7DrYn
         1WzmX7GVysV/bpU0IfnmvDkIO/DRgo4RapWUPXuZWPxlhTWKiuERTI3iuJGcLB6j2dNQ
         xQvNdp1+Ahn49bbhyzlbBIKqikWOa4LVm1h+rlAlRiwUGS52cOQ4rTRwitofNS9IMZSP
         NfAA==
X-Forwarded-Encrypted: i=1; AHgh+Rqbb08aXgshtUHV1GElG2RrZJHY4CA1JM8jYDUR/559lZDgs8BeLGibKr50XjRYdBFc3NETzJs1zrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI7/2OzjIec/GzHV0FGvHJKovd9gfxSFE+Gm1FpW+1f2dJbtTf
	kcltsSKEwCo1jeXljlcuh01tVLRbGvekUlg4Hho1YoOi3OfSy8YdcBk=
X-Gm-Gg: AfdE7cmEKZ0zPW4tMmzAfUmvL4xdh3Meoca4TCGmkC3lhT73SqzloZbu6uh+Fvn/Mq8
	gSbviyywZQDnx7i7X7gjObj5D5ZVaKWm8g5+jky73rS6ehYp3nRlxw+wdiwKh60RaGNrWkwebbR
	hUNgKpQcxfbQEpOrtm4MKHLrOJ/Vr+UoUXw8LgXmcPLzQ4KxLAmVvR50S8pxxGVljtEsel/FJxH
	y7wGxfa6R6QD+crm6m/SNN1fduz9oMAx8kIUlNDgw5H0RBk8IX4inG+9bOZiBX5pEFZ7m+PTw9r
	BM4XFLB/9k8qxIQ2rcoqhVvfkqsBApqsTtckP6PAa89zPCwTvWs8q8bmacAsdM8XsmpU7+fC8ej
	XPGhRKTF2UTWAySl1FHOilyQP30zNOv131yEvwOlFQ5ToaXwCu6TrPdzg9p6se9hpXrMnQrymN/
	/U9Ph0WkR4SFo6xOPrI6U/mJrq+9VLRSR0kBumMPZaxOENda015U0=
X-Received: by 2002:a05:6a21:6cc9:b0:3bf:6237:4d46 with SMTP id adf61e73a8af0-3c3ad7ad65fmr11766169637.28.1784484225791;
        Sun, 19 Jul 2026 11:03:45 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.194.66.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm27967645eec.13.2026.07.19.11.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:03:45 -0700 (PDT)
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
Subject: [PATCH 0/2] Add Apple T2 NHI device links
Date: Sun, 19 Jul 2026 14:03:02 -0400
Message-ID: <20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com>
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

Atharva Tiwari (2):
  treewide: Add a flag to detect the Apple T2 chip
  thunderbolt: Add device links for Apple T2 NHI

 arch/x86/pci/fixup.c                          | 10 ++++
 drivers/thunderbolt/tb.c                      | 49 +++++++++++++++++++
 include/linux/platform_data/x86/apple.h       |  5 ++
 security/integrity/platform_certs/load_uefi.c | 38 +++-----------
 4 files changed, 72 insertions(+), 30 deletions(-)

-- 
2.43.0

