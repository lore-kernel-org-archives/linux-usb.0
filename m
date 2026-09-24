Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DF47ECFE
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253781; cv=none; b=T/D8O0UBUaAUJdRWPE2KMVzY3ASijfTolxtvCl46+pLZbbmVJTMaBMXMKSxxEQUNeEgZCFoogWnDzvg66FBtDYptQJetk0Z1WrpVI+i/Udy2EA7y6QbS7sKlhuBPYrdlOKNgexnQM624cYsZB2bybvjXMsAdW+wLkKPJGcBqORE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253781; c=relaxed/simple;
	bh=8FgMrEmm0JiYVw6ocyB7l9dBdrnuGH2s4bxgWJk2VSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y9W831GDsPBGuXGPuEMFem8A1ABM5owkLsw1VaYQ6FbtLl5L5uZBFM/FnYSDuQGJjXd8MElW9rIQVkRcja28Wk0Cmns+NRELM5xgjveMkZwChCsqh58xk5TYo4SqH4Fyu3EIGwMuRCsvnn/mZSAPDCah5/PyuItzm5jp/nDG5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7CTWC1V; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7CTWC1V"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-143859f5737so2869676c88.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253779; x=1790858579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zh0cibQ7z5HGBDLn9XfRjT/3Pcdpg2HZa7+pEHrMH5Y=;
        b=P7CTWC1VibuAIRema4bt3a3m2TdQ9/515Ql45lXPQKLEvKpp1oatqF7IH1VT2qAblD
         boPa6eoXmmd06T1R0oyqs4SHvpYQvh9J4YUtdiwSvCxZxblhOmpCmqOwxWmXl5j8BpTA
         EdE6hjRvyMJoqJh6CLDze6PE/ZjcUa8hysT8TsVjIac1UAhLJgQagUDm2l7e6yEdVyvW
         k7keywJmqy9PeZg/2jHyH19TCZud4T8V5z4ZcdLqxt/bgOWaTTgvf7Z45FX8U/EBSOTC
         RQKhbL/9l32grZAwOhKd3ppOtixKe0k2sQMkBRgzmmxN65LywWyjDz5IPV6SWnzJjEw2
         dtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253779; x=1790858579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zh0cibQ7z5HGBDLn9XfRjT/3Pcdpg2HZa7+pEHrMH5Y=;
        b=DkqQgKGPYyVfvghRmPylxqALgR47olsWKVxdIEoYJZgYOYKC3QqulnO84lqDZuFJzC
         SoM2mlF6zKlnAAe0CSx41iiRlF0Cyc6zu6d2f5BPRQaF/Lilfp1vL3EmlflFnkNm6PbB
         OdsG912bMAWFYGgwdNi27/+vYFj99t4d8/K8WVaV8QFa6kEJ1hQU7vqFS1MD4Tp++oOh
         PS6JfqQaMDZuPvlIRE534b2YlDZBkzsG44ExvyUl9axsyVE/lhNFpbyejTEfxX0L05DX
         wGIsEt7W0+lDGKOqJcF7qN99ONFSv4A14hutUqmwC3R1igaygrXhsX4mh408S8Qau1iu
         NGsw==
X-Forwarded-Encrypted: i=1; AKwUvByXA0IZ16f2LrqOUow3HG4aWmyPoYfAodQ9CZC5R1DG4zD4WofH5+MvDKqgY0TJGOU6z1L7bH4ATYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nXLYN9K2AfM/1J3WSLIdv3L3hNwM3CT/QV8HKeimSRFN4rEo2c
	sf81dPEkwh1HgYo2kWyGRRb3fZtvR4iPGScpZq33CbR3w0lJwPLsMvOj
X-Gm-Gg: AYBFou0j0p/fM3e9jU3J5SV9V5Iibwr8drgdG0C+ogmILiDydY8VwHAGAzPfbCm3bH+
	QxRRqPdDbRgDEnuK4yL4e2zxfSyyH8xyORC+LpV0nxEtL2ruAX1daa6y5aRrOslrn3kOvvTb3l0
	0YhStoxU8Xr/S4pUA3VloWUiTEzNaMQUgkFmlAskhi3es/CLYCbJH6hQW+QqZ/bYw6+0GU1Mbg/
	EsBF/4C3MASfqDZ7ywBxoBdYXreiyG0FtBCkjcuRkLmnruQFNM2SXLSWGRyingqMay0oBWNrclU
	cEepVhoYi92uPfvxpXmPxODy7VQ9WQOnXRn8gUPZZPA+b4GDEkdiaJ3cDqD+WfbtBhcU4tXJ6dS
	sgIwQTC+sdGmerPQpjDSVKdARKs+8VtFrlYEJD7KNRcT5H90BT7qaxyMS1dE8BDJ8AKcsHSa2xG
	caymvngulkgxGcS16qIWbWc3vY9o5g9/6ZXMhbdNHsbzrilAEPvlogkhyN8uE7A3T44TnJ3DApU
	Jyn2qxe
X-Received: by 2002:a05:701b:42d0:10b0:145:f4:13ff with SMTP id a92af1059eb24-14504057eb9mr2029569c88.43.1790253774401;
        Thu, 24 Sep 2026 05:42:54 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:54 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] PCI/PM: Do not save the config space of an inaccessible device
Date: Thu, 24 Sep 2026 09:42:19 -0300
Message-ID: <20260924124221.12374-3-fbeltranmillalen@gmail.com>
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

pci_save_state() reads sixteen dwords in a bare loop and then marks the
snapshot valid unconditionally.  If the device is already inaccessible,
every read returns all ones, and that garbage replaces a previously good
snapshot.

Restoring it later does not merely fail to help.  On a bridge that is
still alive, writing all ones sets every writable bit of BRIDGE_CONTROL,
which asserts Secondary Bus Reset, and clears the primary, secondary and
subordinate bus numbers, which unmaps everything behind the bridge.  On
a MacBookPro14,3 this is what removes the Thunderbolt USB controllers
after a suspend/resume cycle: the bridge keeps answering, but the kernel
has just written 0xffffffff over its configuration.

Check whether the device answers before saving, and again afterwards,
because it can disappear while the loop is running -- on this machine
the window between a successful read and a failing one has been measured
at a few microseconds.  Read into a temporary buffer so the previous,
known-good snapshot survives if either check fails.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1740,13 +1740,43 @@
  */
 int pci_save_state(struct pci_dev *dev)
 {
+	u32 buf[16];
 	int i;
+	u32 val;
+
+	/*
+	 * If the device is already inaccessible, every config read returns
+	 * all ones.  Saving that would replace a previously good snapshot
+	 * with garbage, and restoring the garbage later does not merely fail
+	 * to help, it actively damages the device: on a bridge it asserts
+	 * Secondary Bus Reset and clears the bus numbers, which unmaps
+	 * everything behind it.  Keep the old snapshot instead.
+	 */
+	pci_read_config_dword(dev, PCI_VENDOR_ID, &val);
+	if (PCI_POSSIBLE_ERROR(val)) {
+		pci_warn(dev, "not saving config space, device inaccessible\n");
+		return -EIO;
+	}
+
+	/*
+	 * Read into a temporary buffer: the device can become inaccessible
+	 * while we are reading, and then only part of the snapshot is all
+	 * ones.  The previous snapshot must stay intact until we know the
+	 * new one is good.
+	 */
 	/* XXX: 100% dword access ok here? */
 	for (i = 0; i < 16; i++) {
-		pci_read_config_dword(dev, i * 4, &dev->saved_config_space[i]);
-		pci_dbg(dev, "save config %#04x: %#010x\n",
-			i * 4, dev->saved_config_space[i]);
+		pci_read_config_dword(dev, i * 4, &buf[i]);
+		pci_dbg(dev, "save config %#04x: %#010x\n", i * 4, buf[i]);
 	}
+
+	pci_read_config_dword(dev, PCI_VENDOR_ID, &val);
+	if (PCI_POSSIBLE_ERROR(val)) {
+		pci_warn(dev, "not saving config space, device became inaccessible\n");
+		return -EIO;
+	}
+
+	memcpy(dev->saved_config_space, buf, sizeof(buf));
 	dev->state_saved = true;
 
 	i = pci_save_pcie_state(dev);
