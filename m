Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D953101A5
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253768; cv=none; b=XBc7sDjKQj8LazwKWGw0LgYlHdLxSmpFzjn0g/6Xd0v54e8KPuQnBhInH6KcF3b3pLxkdPAmusLTacDTiBS3l6Nzgqcs2yMDoK68cfSuQxRmgz5vvg7InkqrK/+TOkVc6uFCIfBJ27dLFxOxrBkvDOh0JDrMNNPtdiCkq9xbEp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253768; c=relaxed/simple;
	bh=wLX5ACO76CYyjqvPrTUiakOoVRgLxi+/VLgc570FxQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m7iCE4SpHAmv+tMi7ubbgXeiPwawdHhAJnowRdcRBa65gySAzqgpTl47AdSUOqCikB1TQu/SZu+Txna3UVPLUeNQLrnP/8ptRFB6W1KZcaIVBAa1nHEFV8udKMJ07J8QTVLZgRDp38u2n3ojeZSwPMuQV013WZ6iMAzMqYuIDUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giAW6efS; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giAW6efS"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dce6e235so1562011c88.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253766; x=1790858566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwZSkoonyIIiM74/8ebCFVKSM2BQQiG3RNHpeccfAIo=;
        b=giAW6efSlTWo/0be2oUH2Rx2a8pOYgAjqskmFa6kYaluzpIK4fLPSMpMKbMrJVNXOq
         Lino9QgrYzLM7tClqz2CMlxNgy+iDmJ+AVktKHlTJwGPQuSpL9dX588tualy9Rp/yWyW
         xYlLwSztK1UF0sEci2HngwapUTHjnyUJaIfzzb7KIQaOHzYMHoL9N8Oi/zA99vfl2Cs2
         iEF690f/01D22xKaPUVvnsRpDIEgw8U9ANCd4FVz6xmqWoTGZlAGTwK47Ylm/K46Va7p
         Q2U27EIXoQ1CspQJ/qlhcmcOoyxlZqnA6ie6v0zPK9aZxqrAvKgTN39hoH8ZsGLejFRi
         v2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253766; x=1790858566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwZSkoonyIIiM74/8ebCFVKSM2BQQiG3RNHpeccfAIo=;
        b=FVXXxY0PjhVKUQQJ2Kk64aPEuF+emeijxIgiDr7ze2YVweWrlfm52RsJrYfZN/Lmy7
         LIvrWh3uZ7QUJd8ahxCOYjocy7gAodlRbT2MN+C7wHwZ7Mjo8Ruhf9FiOxs8BA+1J0Re
         PYTcCa3qwC2FyStQxzgCxkNOuWQACEpiweRqH9DfhOL2BAJJ5xIU+AuuzZowBXaJOho0
         WbLsvyXKeauRgipZvexOvrRSoo/zG7gis3IOiD4otZXZQZ0526sbvD7GuQQb9HDei3dC
         VNErq5P0llyZVy9bBMo/pgoKwecsMkuVWnIeZ4dBvlMFKEypZoTxUZF5dnVhe5nuMup+
         Fo2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCsIM4HXP6Qn1lfaWk3fKa9klr+Qq8lxarVGm5n6SJW4Sc0EICByNvjDLTi06XvSNzn2dg8pLoD4M=@vger.kernel.org
X-Gm-Message-State: AFuF++lCMNSEVMRlyaw0ICr84wQAvKHu4xdtqqoTjpltxGMQElTkELrC
	n4n9Cdf//+yC10PNwelTWcPhh+6Q+CHDVVE5ejvRAqVQEtsaCD6TOylzjls4Ag9v
X-Gm-Gg: AYBFou05lAs5YytAcKeDyZ80dJP+OxaADh0tYMBPNmsRMArn0ejD9Ady+wHppI2gqcz
	ko/33beUhdo6o7GICSgp1hPtecshZ4vRhb7Yj1UqanTG8NVYgqoDFCbUuPsrFYzgLPSgl4k8kDg
	mzbc2Cf0LXcjAdNWWxeXjNwRgqsEKCimdEAha+CRwprj12lW/SHghv59IX/jEolaTA7Vlkn0b7M
	nAXDoPGhsHZ1qVcnKnp2bH7EXoJfewR+gcD4hspoaS+IKALCclIhl5hcAA45ci6ZYgCo0KKOoE5
	xVTf9S3bjE780uKMUTgrLgo0galKkMR0JIyETyB/YnRqp3JNF0TQXC+wObPVyIzPDJr3UkmcRaZ
	Fxz0+LjWh0jEF/+/xwuPngSHTCtxyyaCLjTKShTBf3+BH51OsxYp+/AOhJpiKa2ZxfnwXimOqVH
	Vg2jjAqsyXa3/4Ie2EDfmi/KwN9SxJ3WAdHmzApeQRdIblQwB+U9oww71yOCgitYvRfEcJ8GE/T
	rLNyYI6
X-Received: by 2002:a05:701b:4554:20b0:144:ed03:7c31 with SMTP id a92af1059eb24-145040379c7mr1651998c88.10.1790253766240;
        Thu, 24 Sep 2026 05:42:46 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm13466113c88.9.2026.09.24.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:42:45 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: bhelgaas@google.com,
	linux-pci@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] PCI/PM: Do not save or restore the config space of an inaccessible device
Date: Thu, 24 Sep 2026 09:42:17 -0300
Message-ID: <20260924124221.12374-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a PCI device becomes inaccessible while the system is suspending,
pci_save_state() happily stores 0xFFFFFFFF into all 16 dwords of the
saved config space, and pci_restore_state() writes that back on resume --
to a device that by then *is* responding again.

On a MacBookPro14,3 (Intel Alpine Ridge Thunderbolt 3) this is not
theoretical.  The upstream bridge of the Thunderbolt switch stops
responding during suspend, and on resume the restore leaves it with:

  - the Secondary Bus Reset bit asserted (0xFF contains
    PCI_BRIDGE_CTL_BUS_RESET),
  - primary/secondary/subordinate bus numbers set to ff/ff/ff,
  - the link retrained down from 8 GT/s to 2.5 GT/s.

The visible effect is a 65-second resume while the kernel waits for
devices that can no longer be reached, followed by the removal of both
xHCI controllers: every USB-C port on the machine is gone until reboot.

The series makes the save path refuse to snapshot a device that is not
there, the restore path refuse to write back a snapshot that is all
ones, and teaches one more caller not to mistake an absent device for a
working link.

Patch 1 makes the USB PCI HCD honour the pci_save_state() return value,
which it currently ignores.  It is a fix in its own right --
pci_save_state() can already fail today -- and it is placed first so
that no patch in the series introduces an error condition before its
caller knows how to handle it.

Measured on the affected machine, comparing the same suspend/resume
cycle with and without the series:

  - resume time for the affected bridge: 65 s -> 1 s;
  - the bridge keeps its bus numbers (04/05/79) and its 8 GT/s link,
    with no Secondary Bus Reset asserted;
  - the xHCI behind it survives the cycle: 1 of 2 controllers instead of
    0 of 2, and 4 USB buses instead of 2.

v2 of this work fixes two defects found in review of v1: a
pci_WARN_ONCE() that the first version could trigger in
pci_pm_suspend_noirq(), and a partially written snapshot -- v1 could
leave dev->saved_config_space half updated if the device disappeared
while it was being read.  v2 reads into a temporary buffer and only
commits it after re-checking that the device is still there.  Both were
verified on hardware: the warning count went from 1 and 1 to 0 and 0,
and the per-device resume timings are unchanged to within 0.01%.

Tested on 6.18.49 on the machine described above.  I do not have other
affected hardware, so wider testing of the PCI core changes would be
welcome.
