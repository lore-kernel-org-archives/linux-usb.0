Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29CD419FB0
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462980; cv=none; b=CElsQ/DA0NXDIsfIo4r5ClPUC2K1tyEaT26GTV0v7BTwE0Hpy4u6HDIhJYveYAxSjTs8SZpXWCm5oLAlY3/Zmw88F8YWGwMl9c/uEQXuhb5k1p7wdvFEUOl+cM+yZnlXNIa/jw0eryLahLSld3Qzhru4NCQIzXh3dXhIMaNQbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462980; c=relaxed/simple;
	bh=ZI01giqCOg4r2BC/31Ii/Jx+mxfuzQ3xbAm6e2K6C8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oF1sFenuQ/TU3tSbnuTZXelr+f4XH5XYsuN4fWIAXSViaTXBjkb6Z4OKTsKHlwo3VesahvVBmdOQgSe0lK0HLasxdxAuIdU4lhq+oTNxtEVsInYJA9+hdFtkYPwbxhWuABeJ8T14KFJvO1qz6s9SbjVVtboPUwwcgyPzIt/T4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8jYbAq/; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8jYbAq/"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so431569566b.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462977; x=1790067777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=H8jYbAq/k24Q6j1MuXjRsZ9lDK81mFluOzrjRTNB6BOrSQOKLSomPRo9KhNfQFGZP9
         637gAhVJ66x6oFv/Y/rtIFEJBkOagQjIPdMiZ/IzOlInEtQ5jbaeTC7mK+fFWuAXCe0B
         OBF5KHyrL0Sr7bLezopx0wtPTMTp9XTk3JSwHxccLtnQSLDdQYY0Wes0ktYgIJ3g6a0w
         fDtjTPeFMeqhVuCTYm/uNrY48lb5VVlMlgNjjgRvzWGB4WfkzyuscgR/DqqUitovnhwO
         Yr8WhscD9oA3gWOXZGLDRkBYaEAUGZYUmsICqqBjePOkwCO5p4Pe15ADWhrBtFrGYENc
         GUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462977; x=1790067777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96B/n0qyp7z+ICJfhqaTshDbMoTzd8gumlBOo7qhHZw=;
        b=KSD3DtNnFN7AthoxoYJ3Ber1LWOlPqVEl5CChULFvdNPrfs7pwVva77cZ8fHnUTRQj
         1ooJ36HHTAqVbtPz3UmsncPSiv1st6k7BvYlNaTEXI5HvA2YlOjL+SCAiabQ8vIuB3nR
         xw78GvCDBPmnOAyYXFNKFBv7gVPi3OrMT3RU7Hg7Z6N8dfG288aGEAuSYJ3A/goNpCl3
         mFh2frM57MwWxvRxlAMHM+ZgUtbfLALknb2C3PaBS6Olm0JYbRovIUSp+Bo7XchHjPZz
         lCkrdnNBVCHBnnPXYEWxYV9MPmuFJZiJ6wfPtJEgLFRigKVjXiiKW3HChTSPXpdFVqsU
         x0Rw==
X-Gm-Message-State: AFuF++mXEc68JTwiqwJBNPhR8dypdDEl77zLTc79KSb1bLQAumeviiyn
	zwnVctWNaR9K/uPGyuo4wEgFkgrkT63auDl3AFM07NTkGcagptNDZF0o
X-Gm-Gg: AYBFou01Ck4fISZxR+Ulcfer72g7qlxeDDOZzagmcF+3/HD3+g9z1tqvdsjmdcNRcKE
	Oqq/GkVsspWCzlcrWGhS0wf5i2MZSAZ8Qo14RLLeUWr6B+aCRfJDUOVingEWcMq1b65Cp32Ej8D
	hMeLWsrKtkwtubESFA2GO2DEczI+hFxe+1nAOTPDVXi70yqWQgnrFGsRNSJ/CNwzdVnV9ymLCos
	68f3rnPJ+cdt1DdTHhsZUqYix3Nx9sKfI06HrWLRJLQGWWSTIJemttLQ5uYB7518AZ9Ymtrbvxc
	j5+29y7OLHZO4SeO7+YNjl5oHL1qTOZys2wTyKy7VgxOv6l476jLqiarS9qXyQ6cFFMmhdA3JO1
	UsAt9RDnqgNZNBXaddxTvLKKdhU++hKLIsdrjQi+Spj8HN6pqTngMoOU7z7+mHz+t/DaGdWJc0L
	Vg7XsGTyLNcf28Hss1I2UqYT7TdUrUkPPKdfywbGkqqj0DkGoFs8u6a0Cd29WHdBjazn5NyT4FP
	47aN6+aNAM8MrESxHTh8XCrjagwAcVa2kbRY+u/rDeQxOrdIUnQF8xAwYa9Fdr2PrD8pA+ZjI/H
	mOC7ZzkAOlasCC5nhS07jAA4HXuqxi1OlFFUuvVs7zXJOGrXdGeZHztEG3mp9QS42/yc/lXT2kp
	jc4nSdI8VSj1drJ8Lnr0q9ltJZ2M6WWTJrQm0jpiWxSdBS+LcpzbG6qA+nsJuhMu16aGbnlIE6W
	TUtDneAeYwcywPDoTLn5fwF5VYDXui6Yj/4mJS7bYpZhZaS0Kw6yle4VgbCoi/al1JFnQ3DT7Mx
	nskTgtlNCs=
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c29b839a057mr853572666b.2.1789462976636;
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
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
Subject: [PATCH 3/6] usb: xhci: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:20 +0000
Message-ID: <20260915090223.1346-4-joshua.crofts1@gmail.com>
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

The disable_runtime label in xhci_plat_probe() and xhci_plat_remove() both
call pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: b0c69b4bace3 ("usb: host: plat: Enable xHCI plat runtime PM")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..29e743d6868e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -388,6 +388,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 disable_runtime:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	return ret;
 }
@@ -461,6 +462,7 @@ void xhci_plat_remove(struct platform_device *dev)
 	usb_put_hcd(hcd);
 
 	pm_runtime_disable(&dev->dev);
+	pm_runtime_dont_use_autosuspend(&dev->dev);
 	pm_runtime_put_noidle(&dev->dev);
 	pm_runtime_set_suspended(&dev->dev);
 }
-- 
2.47.3

