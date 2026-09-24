Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B0731E84F
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253780; cv=none; b=HJSPScIn+Rm8uZVIzSsPR27kwuqUChHKWxhOrIHon2RXpsrayNq5gA6zFUGzhh64iZ/ez/PFH0Vbp/xLH5tlXka9BN8fbf64xsl722HRjsmVVoI8c9TyR1NywCSKtz+D5iFCmS0zjIEmt2zQe7GobMBtnCJUOdVbjp8+irI+NAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253780; c=relaxed/simple;
	bh=iSvvSNclJPG2ooYiR9bHRNj3aceifTgkKrBOLKWAyB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpfvUmJ9VHaHQlqgFHOwL/FQSvmLjy/gUGkK5YU82qYQf62OF/2tXf+YkTQ4e+ovI6i0G2Qa2jyqk+gEpNRXKwSunk106zxhap7FPoMAJ4ibVcuK9vUf0lAq3A9e9hUaGRlwT7s/4a+m35VCwazUM82Ixbxc0HqJecgIX+PphtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rixI0hle; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rixI0hle"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso793778c88.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253777; x=1790858577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3nSA9EEF3/n3h1KuMWloOJQEZf6Lv9q69NWlFq+IQMA=;
        b=rixI0hlecLqh6QLAeD2RrqsIhnaxNtFRWQLVsA0djKK6dWiH8iMNRJjGXFUiCMPWls
         5HrcZ2gG6eG9Okgr8E4hgy8mVxJqBxHqZVCQgZKRWV6fRW2cX5lzntMqLksgY/7M4Rwg
         TsBC5djn8SduceZaQ2r6NaV60zim6i23v0doTht6kbyjRplOJegARec23+DK+jYZvBty
         MhCaVnzdSKC+2ZV/scjxjvduRittpHxwnM+mu46Hmz290gxNVMg9QOxYYNNJn3VlpMPe
         krBxxb92P2RuK4MAB3c+E2eg0ZbhpQ7pzinGLtxDDB14WlExZhyzE5SZ7lko0qfnzDx1
         kEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253777; x=1790858577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nSA9EEF3/n3h1KuMWloOJQEZf6Lv9q69NWlFq+IQMA=;
        b=oddkwCZ4m26wNLjRhHY9a7kRHCTN4q3N295i7c7viJLtZjWwEWzc6RseJsx5wA58pC
         ebU+ONpwh8i1YGZ7lZuNh9mdPcgBlwpeSbKkksXnL63qBDehnMIU8FYatfXwQspinlUk
         Ax/HxgYl6B9j5paxd0InySESxx51iMbWe9egLY56QUMEr+ljeW/5mg5kiavY9vgENl8O
         +eF4tcu5hYzpUmjx4RU/6etII7nDsEJIeo4L4yy7DI5XeAMopVzo3QbIajfuwKBvkObG
         NjHBodl5uzwlPdMMmWgxmqrud+68RmWuQJ4+VOFOre9QvGEw1NdcMLREMZf9bd1ZRJRS
         kbhg==
X-Forwarded-Encrypted: i=1; AKwUvByHAvNdP6hF1Evqu1GlWwRm2A6D1GW4MFD0qLqRyZ0V1zd+9H8CC4t7EYBP67Rc/PGPNmBRzLa8D8o=@vger.kernel.org
X-Gm-Message-State: AFuF++m2IOd1dEbPWtELhroW6F0Bm1kwrkrWQ9jhFWeq5t/gmpjBcOHR
	XGCYo3dmLln0d4v1cRZ0j8QFe0UEcx4AN9n3MHPEjC1IJjmUVk0i73u1
X-Gm-Gg: AYBFou0AWKL/iTGW4TZ/t0NAIYk18qXY3S0nZq7TgvjXyhgRvKDUNgPDg0DPmIXfCaT
	nZPBJPE5KlLj59MYxomHRMpYhoYPCZJi+2WigdDrligwZOI6PQ2HmiHwDU+fI9d77DuVF7Xf42E
	fFzf5Q5sJSDdSNNN0A2Tr0pzwNtyJ+kkxBV8mhxI7QHjtXq3fW09D6b0gcBgQTPlrAeReMqq/GC
	aeflDYoW8dPs1+QblEy6NZkNpOvKdn5Jo400bdIJWT/uki85opVyM9h7q8LFL5ze7tsNKDFaOgc
	nRQgJxSlERufHzHxl7rx6CPueFsIXbIWiEos12WCrDl1C3Aib+qP+OGuWDpO/PuR4m8Z5UNkOqr
	o0wWEib62sy0tc5iNn41iCECvF2R+bvD4ZfYB1zS47cRH+0FiSYprcFsMtCahyUeYNP+zuYq5Pe
	6prkbs6PTP9sLQEh1L6l5mLemuLaqci2DoKDSECKXRUleTgSl9+qkU9fSylF39ovFtysAEpKVNq
	PKQHIRQ
X-Received: by 2002:a05:7022:c4d:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14503f3c3fdmr1827214c88.16.1790253776803;
        Thu, 24 Sep 2026 05:42:56 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:56 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] PCI/PM: Do not restore a config space snapshot that is all ones
Date: Thu, 24 Sep 2026 09:42:20 -0300
Message-ID: <20260924124221.12374-4-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
References: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Belt and braces for the previous patch: even if a snapshot of all ones
is somehow recorded, never write it back.  The vendor ID of a device
that was present can never be 0xffffffff, so a snapshot whose first
dword is all ones is known to be garbage.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1833,6 +1833,17 @@
 
 static void pci_restore_config_space(struct pci_dev *pdev)
 {
+	/*
+	 * Vendor and Device ID are read-only, so a snapshot whose first
+	 * dword reads as all ones was taken from an inaccessible device and
+	 * is garbage.  Writing it back would corrupt a device that has since
+	 * become accessible again, so leave the hardware alone.
+	 */
+	if (PCI_POSSIBLE_ERROR(pdev->saved_config_space[0])) {
+		pci_warn(pdev, "not restoring config space, saved state is invalid\n");
+		return;
+	}
+
 	if (pdev->hdr_type == PCI_HEADER_TYPE_NORMAL) {
 		pci_restore_config_space_range(pdev, 10, 15, 0, false);
 		/* Restore BARs before the command register. */
