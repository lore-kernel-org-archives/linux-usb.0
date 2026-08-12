Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65F38DC7D
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786508941; cv=none; b=rk7OkMxwIAJE51EfQhxtcvnT6Xc4LBELrSktx6nazMf1B9inqMKGP7/3Nvh0xSLIpXxZkaLcAHlDNV5jjdf7S53LqnF8nOveExhjGg/Uj10bmSaIXnhRYmmw0EDvKdLmwiKz6MHpNk3jLO886HMwi9gsJupR8tp/IeOneGTMuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786508941; c=relaxed/simple;
	bh=2foUZN1ZarhKYhGz7BeiGVU/I65V4tdXI2iSXk3/sT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FKUqnoz+zW3ai7ckC6aybhHN14tp9nnVckarDcNI4S486/38UtEZouAlJ2GoJE0pnCRluD9FQ5mlGGK7lTYo9yPQEkrHPHx1ys9qyJqvWdEuo1WhnlpIEys1eC/tOf+XQ1gYqHXQtRZDuh4w3Qc1TbfsV4t5Mep4Bv9jYn362j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrfAnPyS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrfAnPyS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848761b5897so193500b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786508938; x=1787113738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfSxF//v+gtVkwTrvrITkpqbqxQrUBxyO3+NJDg4Ey8=;
        b=OrfAnPyS78j3Gau3MAHiPjpToLevJ5iHWNo70Edl4HtmP0+tatNwTx2I/7Jcn47gnM
         N+k9zxy5vNEh6e2/TGVtyvIIdFsnBZOnr6xMEyjdjysH4J4/yDoBz49lxCzmGzFwKxd2
         ar3YWTFvvfXczK7WIHv1FM3IGHtlHFfExcRdUd/W1xOB4W02oACyHFsBYYQQ1QX5BPYd
         k9osLZ3IDxx12sKEMJWFObMz21uaNa/7oT0q5ZP4/Edcg6Nhl30MIOHwmJSg62qH5tbo
         4ZlW88NtTAQ7VZFGKiGwb8dNS9GzK+PSeoqZyVnwp3IKBW46kxP0j1gcgUCQmK4slr0U
         qxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786508938; x=1787113738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfSxF//v+gtVkwTrvrITkpqbqxQrUBxyO3+NJDg4Ey8=;
        b=IHslumkGhqXxXiKIYX4NCA6oKaRCGf1JnlifqV+zLsFm+kN3VEjpBsgmwhqytHBS1t
         8A7OsKR0tDjSV8gLHScVCtRZjEazgqC8bArtZbc5Gx11wezqCVKCiqC88QVdQMSotKhb
         9jeo0B6OZ3v7nYnoyoRHRjGcAXlNzQc/GPzT8rgj5AtdL3OWwPIMKtkVOeZZEIOb4iDM
         RezWqgItL+yfGPAQ+yyvgy/xrb7DDVPUTGIOOHcHaEf5V/r9nfrlXZ5GthtVitlA+Uu1
         KBOUEX6xDb0BYzM2KMe3Uf31f0tEZe6Mro0t+277nGn6BlbHZI4lIGPFb3MXba5scxPS
         XIuw==
X-Forwarded-Encrypted: i=1; AHgh+RqAHpqllCILc6DA5TTBO4yiVVhL/aZKz609BILEtHMb68H1tsJw94dks2HimDGYszVkL3TNaU0bEJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgQE8SMSAwJlVd9vdrabmFDv4RDYMNH1j5rjOnVeCpedu9xhl
	ByWhvcty03DqDiDk0mpq7s7rqgBgh8AnqY4Ka1iPHqLzUDyZ1H1+kU8l
X-Gm-Gg: AR+sD13MYe1QFKyNfN5nt/26loenJ0QGoeCbz/1N31OS/yKlhShTwbGPvBvPOiSimua
	JO2UO7DkaRQQdAS799qZZ/RU3UQNmuN3IS0sQwksbcgwCSyUKgQHv3pH1dAUhiBv8oJ02bKdjt/
	OBDLlSWupxE3Ezx0R17clv2Dr5GMDlLT1aZA1ebl8av1Kwpz7y62p8bo6GTSxtNKRANFkxSaYvz
	UZZqEOokVRJEqiqOEDeHKQZfGTymfQ2GczEGkSuM1R4pvn3yt/lBgQnWM1A9YDc6M97uNh7X+zI
	lx7skDjsWgiujzB89TpWr3C5k6C5L0d+OprCgBS0ArooeDRLRScZsRCdN7qFqT5Bf+r7tv5EhYJ
	7DQSZ6fiFfcuaMjRPYIFliC7ig5IpjUoxot9SZZbw6D8d0lOTYOwgxuZsftf9CTynBOP3GKxald
	h/cUjaRJT3LHMf5pH3nxwv/eQctZzu+7oFxCGV72PmAYb+nakC+SK4BdvVhHlbozWBzLV+4kPjE
	HssXco1tIkMQBghjMCJyi+MTZa8drQjUNDbhoLltdLB9Tcy6EhGagFWsscCRbh3jpD8h23LGk/5
	QCjbwbzEc+3XrPg=
X-Received: by 2002:a05:6a00:2386:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-84fb5395c03mr2267928b3a.8.1786508938483;
        Tue, 11 Aug 2026 21:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1cf41acsm476376b3a.11.2026.08.11.21.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 21:28:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] checkpatch: Add devres_alloc() to allocation functions
Date: Wed, 12 Aug 2026 11:28:39 +0700
Message-ID: <20260812042842.15209-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add devres_alloc() and devres_alloc_node() to $allocFunctions so
checkpatch.pl can detect unnecessary out-of-memory messages
following a failed allocation.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1: 
https://lore.kernel.org/all/20260812024304.9350-1-phucduc.bui@gmail.com/
Changes in v2:
 - Add devres_alloc_node() to $allocFunctions.
 - Update the commit message.

 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..e89cbc3f2604 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -644,7 +644,8 @@ our $allocFunctions = qr{(?x:
 		kmemdup(?:_nul)?) |
 	(?:\w+)?alloc_skb(?:_ip_align)? |
 				# dev_alloc_skb/netdev_alloc_skb, et al
-	dma_alloc_coherent
+	dma_alloc_coherent |
+	devres_alloc(?:_node)?
 )};
 
 our $signature_tags = qr{(?xi:
-- 
2.43.0

