Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A08175A6D
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462978; cv=none; b=ghbTgVn3auJTC+eV4Wornu3DZsRAph25UId6uCROYuQrehBFS+lFzsH9+ZtponE7NS3eblKGfGmsT5OnXqMzS8kXvD9qaVfu0tWSjmJ6d3uslQaAeIlC5Zu9j8vxYr+Bjt0SW8XBXhFE6qT+PFGTZLKfGEvGXS+/Cb+0CmtXBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462978; c=relaxed/simple;
	bh=WHzBXw3Vfp/jx3HNdEqzwg/ei+fttabtBIAcfjiy6Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aa8YP562NS2MU6an/K3nsJ5S5nkbKj0RDigUQ39tPNqFxUSnltCgA0zFGFq/+mSmIZ7kAMsgt5ZWa7qpKEFevqrFStmeg/p6QoLDYpktOdtNa2sQr9a+12AwBpK7TGiCVKxDuH8C3Mhc+YZs4vxaKjAVKujjnYxK/sz9NxpTjWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfK7t6Sq; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfK7t6Sq"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so7054466b.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462975; x=1790067775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=AfK7t6SqrhvJNGvaT5XeMxcFQ7vRkJOrN8YQ1NATGlhuZ5sBt2jPARvZe6RNeka2At
         29/6fWT/Wr02orRNuebvHyZMyz/WynCUvdLyteq2rCn4e0lfB7Yj9I7bm3qHZmckoeXc
         +5AEZvMmwr0xjhndzUZeHYM8KwfsXqDsaRehdoJoDYBn10h1wYCHG9Wl9EiYtx37spn7
         ZkO1y4Rs3+0UiCH7taognZx1+sbF1UEgIryTredC0xTaFXEBPaNkp5WoaopnBPZEgM4r
         /J/KRVAk7UaPbpgS4fhFen9rEP1i/S2tLd0lQ2/Db1Z/QwlAga3MPaHXUOTLT4t6ZuMA
         iO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462975; x=1790067775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=A/bhWZg7KbRJPJWF1EudGxijKw94KObI9W8XGe2qLlI0Az4zkox4Y7+9tJTeLfg2r2
         dvvX5OScR0tWQGUaPwCd6irj7Eeuf/xnhcZdx5gBqt1rHdtU5namKEC90UhxtaALGmR4
         1e7dtHFXFyfhDZnOhaH1LvfUKumfFedoq0+8XrQy8nmK23wLjeR3aw0ikARRhXCv70pp
         fR3j3obE+WteHqStU8dTb19EWnqzDrlCwTNfc8XVKUWd8iYRK2sTKOtzHvoOEqRd6OnP
         uGu5fJ1+xELj1wH28+igZZ7xwWFyMiru0pkzqsfea4SqZ/6aZ7pu3k/T3o4+X4li2Zrg
         uBBA==
X-Gm-Message-State: AFuF++km/TVNSk7jkXJlkJKabCTk786XtH4ebe65okFhGdQvFwtOIU2e
	6c89OK6kVuEl3eZWi1wSRUeZfGYRNkpus/yL2zXBsMve+lrFaP54lB+J
X-Gm-Gg: AYBFou3c5gEdTVaAxnpp/aF25E6CNNrlfJ4FT/R1FphIcZpf/7lkqYcRa40EpAh2ABz
	MfI6ELO+AJTbmOIqkUizBo0obXQ+aIF4xqYi+fqjag/GdN2KPGutpE3AVe2VD+7f9nGusiZ4B7j
	4G83vPiNaizMa9fIc7lG49Cn+kRmrLlolJI8nWI5V/firnd/VqkD1aaEGpXjG7DgSFt8Hta3WIQ
	03YfW7ASL7ScFAHnt2/HnhkL+3lHikotjCGgqIas7/Rw7cgeurN5698OiCNbCKLCClZzrTwxoAO
	0dXxtLltQ3P+qa1dDLYTSzbfuaGde5Im8VPMSiER03C9aNLgMg+yy0pWN9HFWg/OX9zZ8Kok7Ay
	lKoEFO8EVeF7j/yNN7cGLEwGUp+4xrtwGi6RONqzV12xT2L14PoxfTqOu37OpfPRtAgT3JXZYk+
	BSJMKpSX+KUjZ2aRrb/T+wQvPOFXXhYtmHau29tPSXfZeZA88BHKm+sNr/KqXpurJsnm3/t5V3l
	tAeIvjy1gmduKJfBB3VnJH2brxitRcy2G354tGyg/sdMX7vSOcUsaqDOCqMnC5Tg9+fDtrAJ2/f
	J4WSLTA41QaP70l7v77p5gEdTPRl/CRYjMHZM12EW5rgRI7320umnVBKnHsyhZA3BBZnaNDk2Hy
	UmidBA35vu0wQv4it6tEwRR5ib6e1GvZ8CyuA4mx/Onuyd3Xy+GnGGcKrh0YdvvoOy30EcTpV6r
	LnBnr4z/8fg3lEWuba4P3h7N/z598QHLLE2LebyXfi3jJoLlIgEXOi3sO21lHG99dfHyYV4ctN1
	2fU1owCCHA=
X-Received: by 2002:a17:907:948c:b0:c29:49fd:c98 with SMTP id a640c23a62f3a-c29d7926fbfmr13664366b.32.1789462974448;
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
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
Subject: [PATCH 1/6] usb: core: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:18 +0000
Message-ID: <20260915090223.1346-2-joshua.crofts1@gmail.com>
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

The fail label in usb_new_device() disables pm_runtime on failure, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..dec6d5c49759 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
 fail:
 	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
 	pm_runtime_disable(&udev->dev);
+	pm_runtime_dont_use_autosuspend(&udev->dev);
 	pm_runtime_set_suspended(&udev->dev);
 	return err;
 }
-- 
2.47.3

