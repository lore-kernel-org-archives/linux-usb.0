Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF43A1E80
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304672; cv=none; b=c0VCrl0XTD6nkcJ6nbV8sAAQSxqldjBxuRdo3n5cnSwXzjgLIRSGl+ZOu52cTd5YkO4FH9Ce8rP0qUXsvDVxsfqi71wtKAbOxZH+bS8tnnabxODxvQ3E4PIxfWx+eWE8YZgCfsRtkpZwL9IDy9ra6x5ubC0j1/89tGm9vw1+Ok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304672; c=relaxed/simple;
	bh=u60/h86UtCV0RHUmtNCYmhLRPiuBkicoYzvb6oTOgXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRBd7LjTCjN9HxZm5N34FdUWw71b6JYeJ1DCPNPcohLP1VK3+Cw3HBxWjwKDfUsMHWmejN19Ihbc1Zx4cIUjhW9g2ZwCY6b9sJkeJWFzXSk8obWfwYB2eYbUDIpkMJyf51bd6s/kN3D18F2alfEl4jaZAURQLV6rnmA+5HHJ41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=sP5FjZ6A; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="sP5FjZ6A"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso768210a91.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792304671; x=1792909471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5RPMRI/Z07lJ0xDImPcnvLDgkc0YFq5cW2OslfyXR0=;
        b=sP5FjZ6AP55RaaNfHtG6IPu9Tot9po2x6OnJDLU7+n2LhOFxC6CejgUGRboE/Vq6fB
         CPg+LjHXPxuofU3UVQR3jgaIa77V9ff/9Ldo8+JWqRofhOxltttDU2X25nEG2MYrNIBb
         0EANDKv/mmwxP6qIFPcmxij4ll5w1EnvCGDBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304671; x=1792909471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5RPMRI/Z07lJ0xDImPcnvLDgkc0YFq5cW2OslfyXR0=;
        b=0ekIGT1mEnrVy/bV09WlYNO+gTkerk2KARdFlBdMw0y/XBWiFs0yE9jdcmTLsUKMTH
         th6dNFuEruM2nktu33EucG3cyh5VpODtEwSytXSLFpwi0cZsFzVCpN3TQu8oqy2a1sPW
         EgwXath9UeJHqFQVtpjxkdKROBUn4AI9s6Zj5A+NN51d32pmRar5gwgCCB/bnXT8wPpK
         cOfJCTiO35kEkiMlk/pi2cuxmir/puIZLUFf3zkf+tKbOiAtv2dNpVkZzxr9SrND4Jmg
         JmLBMfePbYi/O0j1SI2XG0aJD+HHm7WlKAt9O2ph/83u4S83MchVvSwKMzihjeiUlY+j
         9ZlA==
X-Forwarded-Encrypted: i=1; AKwUvBzMPhKGcOAOkpzUiBl4DaNQBtaX5QRkOtoDhETJ2VntDmL+j2mOxVMey9In0i8D9O6UZaMC532VmNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWOaju0qeShO9SCKYbm5IBwL58I3n43h58lBHZ2aT0Gau5TSwe
	98qiC/kqXJnlelXboyWoiHF0fKgujknzv5YcuvQvxJAlVobzndPNV0tga0MXo2wLzLA=
X-Gm-Gg: AYBFou1XuAaWHycHei+jj9ZPbpFkfia16Kpxh7FTTRhQMzVkNiOgEuy9GD2lyzv2RLB
	GRtAmic9rSy+tR1FtlInhsiqpqX0MepwBwD5K8hl0ubkt94qHRuIXJKhFcePWrX1xtPWiUdsCFs
	WB9nmZ2wOsDaK63BGhPETZmzeafPrJntHqiq52tIYmyOEoi9JOMvME5GrNHBqRhK3qSBj8UyxN0
	EBXxWpvpgijdMVJzrKb8r3DEyIXigHemhrrfX/ZBnWtONcQDbfvCkx29G7bkpORcM5CarzXskFk
	9FeiBHIMxdAMdu9b/n9ePWvnxCYw+VlUozg+I0CeIaiIHsOj+XxlKEiblCd1uk9FHpHFd6A1Kzt
	N2SY3kcQoAiWA18b1qU7yOUE9t71uac3006NqDd3PML5RBATBNr0zRuEYw2CA9emf9K5P/7bqy3
	XhWM4S1Y98jAMRB4vTird+B72rGP2FH324QSu+kEFVCIvU27RU+xsv3aFRbHkX8+UiqVz36BrdN
	twFurON6RK8Yk9hZ8UMkKM/2i3JTxl8CYJV0pZmU9d/DsA9KkOuKtM=
X-Received: by 2002:a17:90b:2708:b0:3ac:80dc:f409 with SMTP id 98e67ed59e1d1-3acef5dcbe4mr3210265a91.61.1792304671066;
        Sat, 17 Oct 2026 23:24:31 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm10513293a91.4.2026.10.17.23.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:24:30 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net v3 0/2] net: usb: lan78xx: do not use uninitialized data after short reads
Date: Sun, 18 Oct 2026 14:24:17 +0800
Message-ID: <20261018062419.21921-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan78xx_read_reg() and lan78xx_read_stats() accept a control transfer
that returns fewer bytes than requested and then use the uninitialized
rest of their kmalloc()ed buffers. A device that sends short replies can
get stale heap contents used as the MAC address of the interface, and makes
ethtool -S report them to unprivileged users, including kernel text and
direct map pointers.

Patch 2 makes both helpers fail on short reads. Patch 1 comes first so
that a failing statistics read does not report uninitialized stack data
instead.

The bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested with a LAN7800 emulated by raw-gadget + dummy_hcd, booted with
init_on_alloc=0:

- Zero-length statistics replies. Before: 40 to 88 of the 235 ethtool -S
  counters are non-zero, including usb_api_blocking_completion() and
  direct map pointers. After: every read fails with -EIO and all
  counters stay zero.

- 100 byte statistics replies. Before: 110 of the 235 counters are
  non-zero. With patch 1 only: 29 are, so the stale tail of the buffer
  still gets through. With both patches: the read fails with -EIO and
  all counters stay zero.

- Zero-length RX_ADDRL/RX_ADDRH replies. Before: the MAC address
  differs on every probe, is programmed into the MAC filter and is
  used as the address of the interface. After: the
  probe fails with -EIO.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Changes in v3:
- add the missing Signed-off-by; no other changes
Changes in v2 (review by Sashiko):
- 2/2: the commit message now says that with patch 1 only a partial
  statistics reply (1 to 187 bytes) still leaks, and that patch 2 depends on
  patch 1; the MAC address paragraph no longer claims a write-back to
  RX_ADDRL/RX_ADDRH, which happens only for an invalid address. The cover
  letter gains a partial-reply test. No code change.
- v2: https://lore.kernel.org/all/20261018061734.19488-1-law.wei.jie@gt.tech.gov.sg/
- v1: https://lore.kernel.org/all/20261014025602.26334-1-law.wei.jie@gt.tech.gov.sg/

Wei Jie Law (2):
  net: usb: lan78xx: do not update statistics after a failed read
  net: usb: lan78xx: reject short register and statistics reads

 drivers/net/usb/lan78xx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: 7ec48f396a1d89532c0537bc38b408b8c31ee37f
-- 
2.43.0

