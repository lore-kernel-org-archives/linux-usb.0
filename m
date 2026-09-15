Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02746EC95
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462982; cv=none; b=pnuVjZZiOcfk+lXfCaez+txeaDPIeakUCkzANrlFQK2Gh4aTkkck5LmOpSSYpmPCom/EHlLbGvsHjAlG77UKPU5DIh0HDs1yW6EdwCWhePh9732oHhinHNGSG2lKyUwN4E8k6MOupShsaNn3BPt2Lh76fKYThxFXkKMKVo/MsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462982; c=relaxed/simple;
	bh=I1E5aCaEBVe8ChMV1fF1cL0PZhqlKxPCI5YYxzTLLHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx4YceN3Ww0cK8sdsBWrdcB71KX549NmhZWj0K00+X/U2isvPJ4iMS7/wEN2ac4VxhW7FFRQDAiNz0gUnVRDR9T0HiX/3HOYtgshI6uApJMA0ww+/6/o42Ybkr5i269jrdNBuosTW59q1M2wvuadsAFAdkCcilHkXxIAEGG2W4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxs0A2e6; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxs0A2e6"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so8496666b.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=cxs0A2e6v1ibZcAaQAnCXppZFBX3CV9HA3x50ukFhPhdPtVVjeF7gWgnlBkORvB1pG
         Rj7dGj19s8jvW2jGAeg/0CG0kwqXbtO95nvg3bOxoC4FwZ3+3xnfZlgMcnq0XH9tdv9X
         OldPSR2SUQIW7Hi/AzLb4qkrARZ9867HdusBLTa/3WuuutzumHgA4mQepD0kJsSAIwS0
         Nxi7C1j9qhcKK3ChMeNKRZw00Ww5GknXFmrdFg0GyYJeXfsLMZwpbsFWfVKPbSJo3OgZ
         dc6C7FljpV1Q7TF12I+LHWrerLWMqqTt8nsmbnF3b6rlmGU4kxKavopuxUimNcgDCF8N
         yfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=ms8LBp2NgzgqGm/bQKtXJ4kPA/z+C4l/c/l9UkOZSv0kHyigiD/feCLPhkTEUp1f/C
         MVkKHmDk8a0e+PHMIhcHRIepfw/Hr82OnggXQ//vFYJ5smp6A+8WAU50w1WzF871SoJ0
         Uuq2Ol2Zp4v3KowSX7W0uUviLch90ZJpKX4H4K8AciBJOEBYYeGYenawaCRb8JZs9DqB
         QHxAuEIuXYAeh0aKwzgAWNdxWIB/qj7oXQRj1NnmTtmkKOVBxuHdvWgLSD7LVfNaV8g1
         bh6EOzRUdrHPU6qZGglYMGAOD3+DcQ39Df4FzmVy3HFkxRJ+zZ/mCeJ39hs0K0D0SM6Y
         2YXw==
X-Gm-Message-State: AFuF++k3kGRn4NpMik8P2M5MptQY2FG4pw3vQ8ChV75qZHbBsBP9CD+h
	s+N7qdle0raoTEqdnriLI7q2gKsn7H6ClPKZh4kmJdiQ1P48A7B4RBCM
X-Gm-Gg: AYBFou3WRrhKW51ujiPiGq5INSyFQC+ajP7fMZ4RW1g3mvFYeBoOrNmicgi4gAM/cIh
	mVBH+hzhkVgq3D6leV8aZVj8GnDVHzqHWwZ2HsTEE7QDKphRx4uXQIfKI0LtDPKn0qBr2w32sa0
	7bkuAfjW2ZxghKaIWvk8l6ik2sXhMpfSGS5WS8u8ApP5rgFk4AE6ZlxCQH610QCeN0FhX0eAa1Q
	2HFYebbg+lFEmf7XLjOqwMtvWduiWwXaJeT43CPZI8+r81SwcfecvMWOREWy2sfdc5j3BknISPB
	FdPxOHhqUeSjmLLu+vKUo2Ka5nUD+LiZeNbdmsQrqKpkrvqH9oxgBw9R4olyK+0GqrljUC2TW39
	93YpW81673oGNID/X6DRge3ygiPRaLQs1xy4obx6wd/G9bRhkiMu02Z2mVdpTzeKDw1ZQ2FId1h
	nhIx0gD5Gc/o5pkGXHBYnLb/C4whqSw0iSKHB9LKdqoEABMNvAyfuOCqG53g6VrfpK+WTXMGf6K
	2FECSMfe0LVP10EHv0SH9pTDNNNiZTlRLMsm9zP9ApcF67hLUabaQtT2s46tJuVxH0Id0vAf0l2
	w2SNTxP3HNjufjEEzlRAOkIMdC7P4Irwy0eEWiOxOlb1QVJwu80Db4njYAi4f0MHSkmmHkqCAdS
	zVcrp6a1qLRri22mNYy98KfozdQrFjKCpA1FGW7i0gLU+GoLWyYf4ao3XtzRnjuFQ3KnEAPLc0a
	VJECze8ZSTDqxbzOhkyhbpvaZLXB1di2RtzVnhv2L2p7X7Gr64zwkI5AmBx0Sfv1EsVu7GZPasJ
	pzmfFq4lWc=
X-Received: by 2002:a17:907:9407:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c29d771747dmr18032566b.4.1789462978527;
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 5/6] usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:22 +0000
Message-ID: <20260915090223.1346-6-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comm_init_err label in mtu3_probe() and mtu3_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Fixes: fa6f59e28c61 ("usb: mtu3: support runtime PM for host mode")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index b4f4c776adb9..ce64c36a98f7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -445,6 +445,7 @@ static int mtu3_probe(struct platform_device *pdev)
 comm_init_err:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	ssusb_debugfs_remove_root(ssusb);
 
 	return ret;
@@ -483,6 +484,7 @@ static void mtu3_remove(struct platform_device *pdev)
 	ssusb_rscs_exit(ssusb);
 	ssusb_debugfs_remove_root(ssusb);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.47.3

