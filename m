Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1463F0A81
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811535; cv=none; b=EqCgu4WDLE+hIsZaFXg5iyb7p7qBRiJY5imMJZsMrur8rv+gzQDdo5OM84QN4Pbpj7RJzZpPNCjy7sM/wVW0c5aXUP7YEDU9BCsKMLpk4ju3nEs36UyaPlhpoFgI10dhRDMYXq/vyujwzcOzWele7SIPNWgpKocOb2th/iSejYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811535; c=relaxed/simple;
	bh=uJZ1B8wibqAtQ/po6gPTO9VnRdTdMqn+jxWG7X3ruJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAjSAH+SfCHIKsta9LkPs3UEQLI1Nxabe033q+m758xcrEaqMG0AaAkTchKCSJL2F/YN+kY8QWlabhE4LSnAhWwJmWAaMfegiGnN0NAH2aGLHBXte4b0velof78sBP1AcPEfHk8sjqyod3qbNhtzEfeo1ktA0xlWwbCnZoXsOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cHhxuAB0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cHhxuAB0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47488efcf30so936719f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811532; x=1783416332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IfhMTQ+yVeOkUZWc654iXeMEDZbxD3Rv2jQjYeReXQ=;
        b=cHhxuAB0MeMOA/ic8j3vunuvftkwZfWtSL05ugIQcUYWT8f7ApARGXkYLjCd9HXhj/
         ybb436z39qKQadFk6vPyZc2FJlEY4fhKgWN05ysbgK6eB4Um0xegI+QLjCH1SazKMq6a
         0icWOytqy3AZ0f0c3BnKc/DdfjuI7BVFrlqRWBY54r4WQ5YGWSrGf9rn40oG/lXfaoav
         15TXaQnrAN3sqa2rZJ/YZww/M+AAtI0SJb0A1LbE7tafFrYobe/afWiuYmsN416at+7C
         d91vMv49HIrES9ZP66Yt0dbF4S5yyeMKDmaQMjf2Qpt6y48SeM2Jkaf2CoYzanXQoRla
         v3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811532; x=1783416332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6IfhMTQ+yVeOkUZWc654iXeMEDZbxD3Rv2jQjYeReXQ=;
        b=qyFfQHBMXCmWX6Q3fLO2r6aeGpvDdBMX1QLaT7wqtWJJO8YLfReHubXngLUbiMsWjH
         S90HSQKzQrNRs63RiGgCK1B5VfcnTyYCDl/qzzVBFwlYskolfphp8xpeCsWSuk+HjL/U
         RmvadEtiPwtMFR9+7O2tirMyH//iOyqpUPxR+cpNdbwCLj9+F6WQe52Mrsr6K9BlhtUZ
         LNIkUHPORJYHgqTq1NER3egDbTnRUFGpdDWGIDGqMfvi2a7V/lHmlynHDjfabfkg7ZFi
         g5PJmwN/RjDgDzHBEMG/hOp9wxRwTlconxiYg+PX8rAJ53NxciFnszPHSVA3dyET1QFh
         oIig==
X-Forwarded-Encrypted: i=1; AFNElJ8IujPT7F5/bY6ET9f1C9q2YNdV8MEzRqMvCzGIgk7BBHAB++W0J2qZOih0fkopHMBaKmvx6KbZIRI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzk4yh787NQrXdnLNc4Y08BuKbAJNcIbKnyDX5ssHmYQQj3sJD
	QPi1j9XCaxynJRCgaj8AttT86UFdDLncQyhguyR51MkjyynXg6cgP2EmwrAuWdQEMSg=
X-Gm-Gg: AfdE7cl2pOE7qU4SCw1XPqRPi4nn7fLqx4eOdOqcIlQhtm4cQK25h+GI4jziJBpxCaL
	n/sDCskkaWhVCy61uyHlCmgYeLDtcOcrAOz4DixCbDdzvyrPKYNoRI9DKOZf1a+NSD8Ez+6wz+8
	CAbywnlhSdoy3Z054equMWUjvq5tPjD2IUTRk240daTXW1FXUcsGzjNuLQsBztDBxRdYtDq/6V+
	QmxY1yN6uTzQs5mXP5WNGKMVQ9Qs/gSgGPk+E6mQncK42+3uSZrwNLr6rEdkzhEwFYaML7fenfX
	07FZRVGZpo+9XdQZxlhnOmfJoirwHW8o4KdUk64VrbXnfYk8VcSna6OyqMBc+n8Y8xiThscWjcU
	lw3xWemmjIhtwoNXd35l/tIFkrCEpUuqE41SSnWNr0Uc563ndraQ9eZPT80WfFFeSIGblqeO3Oa
	ooDQtKIU3fbfq5R8OPib2xPeKsdttp/e+HNB2OjoWCP1hKe91P8974JUjpvUaiQG1UsDMUww2xX
	oEy
X-Received: by 2002:a05:600c:46c9:b0:493:b24e:649b with SMTP id 5b1f17b1804b1-493b827c8ccmr46107875e9.6.1782811531899;
        Tue, 30 Jun 2026 02:25:31 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8d0496csm48967915e9.10.2026.06.30.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 05/17] usb: serial: Include <linux/usb.h> in <linux/usb/serial.h>
Date: Tue, 30 Jun 2026 11:24:24 +0200
Message-ID: <82219ab65d16ee5bfe5a35d11bc938baac3fd3bc.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uJZ1B8wibqAtQ/po6gPTO9VnRdTdMqn+jxWG7X3ruJs=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGpDi1OiAClGuCjvDzh5YJAYyPI5nlujhdDr+cnUmjKO7foDV IkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJqQ4tTAAoJEI+A+1h9Ev5O9Z8H/0mt Ov+rbRPB6/vw5nVsHAnrd3LO42NSCrF1RrW7dKh11HhhTSKbCbgFTkN1HLTKAGTyOwtmkp5nMdf hg1nmNUzTc2wIodzrKJ973WKzcHLXasJE4Doa0l/HFfttcHGkKkKwOY/71K4JSc3zuLDYAN+64S UkSTN9AOYA4NMoh0OclkuXecdZQQVwng6fvtTUeOgHaks8PI15mPFwceIjtSg+Rd9J4/T9dwdSI WAH5rOa6vXyoAt7wSuTJmvrGPj8NpNCCiCk+lztKAu0mwU0/ENc97CyB/9ueCqFpRX/SUyUGrfa J3xilleuGcUlrL58nUnG1PRMEOlac1Hvg6otlyc=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

All consumers of the latter also include the former, but without that
struct usb_driver and struct usb_device_id (and maybe more) are not
defined. Add an include for <linux/usb.h> to make the header
self-contained.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/0f77a5a54484029a341090a6442d67684d94e0e9.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/usb/serial.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 75b2b763f1ba..534e6650e2aa 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/serial.h>
 #include <linux/kfifo.h>
+#include <linux/usb.h>
 
 /* The maximum number of ports one device can grab at once */
 #define MAX_NUM_PORTS		16
-- 
2.47.3

