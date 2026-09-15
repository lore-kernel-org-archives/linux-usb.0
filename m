Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1E3B7767
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462979; cv=none; b=LiClHqewnB1banF1hOKpv5uIr8m8etQUVs3JSTvTBpMM7uyiJi8dUsHKR/DKFvdNCXVjry15H6rmDkdn+6RjbrT0ySXha4CIs4s6N9Y8JXOcnZH88VJ3VJDlPHdrvq2WTQ0Z1iQ4CnSRayz0wfNmYbwRmZcdDwHJT/zmlY+NoCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462979; c=relaxed/simple;
	bh=m9YQCnZ4wuu+r3kwEyUolM5dCU8c97GRk7G81aGdFR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlcVCYXaqNSH/2L3luuXy0n0ZJ6m7rnu+b1U0b37c9uerC/ihl8PeUJp2ee++t/XLJdF6dje5sbRr6Pw2HAdccO7JgwPnMnSSmpZ8HV+M/GrrSNjUwOdAeuicjHydFJOQcaD3gCGB2jRfklR5i00X3MaOmm0TlJppx0KdFrkGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKqV/k7u; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKqV/k7u"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so432017766b.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462976; x=1790067776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=kKqV/k7uJEeSyZTnhKaXCxXp7QeU2mYEu+6D7Q244jXM9CJASVLdYF1/E9yIp/eJpD
         spGig9UQYIKNYaUlTPJGzWd0qxmVvD8E6AMJ0xfLffN5+v/LD1sW35YeTiRTYsiHD1Qb
         tPFmmRBTWWSJiyyPoRIAS5/Ty2zoOwU6GqAmzoWuYT6D1emwhsnv4PO6LL5zuEgv/VDr
         +5U+emCeBfh2S1ROyHxxjeRphcEPJUVHoTc3K9s+OqGswr3f/lbGR+D8L8cT7KqyRWGi
         2n/ABsAblWdjCJsx8hQ66STSUhx628cLwRRvvbpyACzcVFa6q9R7lYb1Wluw7Yln5Z5x
         uQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462976; x=1790067776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QV6AlfXXw+r11qGovTiPwbiifuuf1ZUfq2GxVsn5iw=;
        b=b5nHaSTO/NnedDb6M4iA3g0hrVUZPzQXbEAw31x1V+eWWVsXxUk/gTtasClRuFV7Zq
         raIZjZ4FQ7BfqiGFQlNSfBIseXNu6f7JZJEfib9aSFdGQnz0jSUmnko3dcIrhqfi2uKY
         breH22TqKA8PMOTbxGUPGr3z2lG2HcdrjOA1T57ryYiwZhYnrgAMHC5NjA68r1WapQ9G
         sqtuCOgTksjvlNeAMwJ3H1EvThSJlqBmUWBF5/Sjcq9wckl4uBcQa9rVVgEXCFbJZ/hj
         fLU5LldDHUjkKof8MiXaQgQ7lUxDjqM16uRGNEP6WmiZNARmhRbBxgnpfCZPgmEi57TO
         5UTw==
X-Gm-Message-State: AFuF++mkvLyXmx52hZI44NuW6q18l/bIORnRCrLMbN1ZutFO9meMn2xr
	xHOj4CPRXxqmmV9TNiTGsNczt7VUKVX+ggndS8kaMN01JSsjDUahFW0F
X-Gm-Gg: AYBFou0j7/m+yN56C3h1tm5aKl6V8TSwjoHHNpEWSyYgDPUadfRimhJUfLW3+huUZLX
	v2av+9Rrwg6m8uwwD7bWIfFamMoiHMj8RMlG0ET45by8UN6QPlA92mvRCT2Jo1bp7MKw/r8T3wE
	71WJ1P5LBuh4TOOfQY2G6MAj6p+B8KG6NfuwiD/Vqkbr/tS6f7WuaOn8f5/XsrXe/fxlsq8AH69
	zrNMlaYEPvaAQ8jHKNjsIMxIicewLnwARTlrQIo1hJlgnjXNadB2lhSm6WGJSrgRDeASh6x9ak0
	fyOJEXb19S9bufPhv1YO5k57TgpU47C8jEmFlHOflv61dpYMih2syIn+dO56aqveSW0uFF3WfTu
	ZdfAkaPUfJUQXj+VWPt5whLWBikefK5dJ4cp2Q2r1XNXbMKqfeXQboYmLgdVhDTiF1FDYqBbAnT
	T6BnNfS57TA/eFZ97g+kT3FKuqB/e//H1BN6fR3CGtUowM+WYUjqdB4Qxu50yHFnko4IYHA1blv
	2J/lZAPtpIq99hKLEXGDpBiVbuN7k83sIIxkwS6hpASI58lluT+UtqkOe2WFoCxbTFfYQUyIW8q
	4rWLDvzLMCsA2rj5Nf18/Nc0C3CqgAWZGgnrdhoEUhPVGqmElez2PtjEs/MRXRRFPAqi8wqQkno
	4wtOyg1V2yCMBizTwi8p7vQzW1elLAh7UeTwqDYfYEVQr1spV75HAC838O2sflWRXvqBGRmzNDZ
	s+xJLpnWqErkqaZvKj9MzBKaduqQZ9WoayHJLLZaEC7NOOEzce/IdBuyA/HhVf3+R/5Ri8L3JZF
	TiTxjHeKyM=
X-Received: by 2002:a17:907:720d:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c29b87180e1mr401204766b.42.1789462976048;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
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
Subject: [PATCH 2/6] usb: xhci-mtk: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:19 +0000
Message-ID: <20260915090223.1346-3-joshua.crofts1@gmail.com>
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

The disable_pm label in xhci_mtk_probe() and xhci_mtk_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Fixes: 04284eb74e0c ("usb: xhci-mtk: add support runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 60af5fe29bd4..eb483a267bf6 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -700,6 +700,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 disable_pm:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	return ret;
 }
 
@@ -731,6 +732,7 @@ static void xhci_mtk_remove(struct platform_device *pdev)
 	regulator_bulk_disable(BULK_VREGS_NUM, mtk->supplies);
 
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 }
-- 
2.47.3

