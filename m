Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F983F8883
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484040; cv=none; b=sccIOKvkZKIKkaE+twxYQXQZFXwql36hchJ1YdiKncrlw+qLLomhxOTerTl+/jkus5cELqjUMqgE6WtVxJZc8C6UXFPbu9UO7Z+MmA8x7wAAyTY2df0J51N1TGFnjIKq25lv1O3NS7Hnq8qXodP3A8yGJEc41/4np0sxG4/fGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484040; c=relaxed/simple;
	bh=YBCYCy47NuG/eSpPyaKy6wAxt2xRYEnOsi7pxz6IRKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9XRdRSLkyOTsnylXU4u0lHs9+UhFwXHcxQM9943iiOQVYqLWlAw6YB6HDyDngSrmjfyQaGirR3nLbTAwgk3OTToNrwhIAzS8K68KCZhmB9zur+fdP+tSg/pzjgSQ8XaTIUSWjf/0iOlwPogPI177IvmfAcfAuQQmEhWg2nW3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gBCsg7Uk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gBCsg7Uk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-697edb1bf6eso1524482a12.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782484031; x=1783088831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7quUvcamcA3KqanUCH5Z42n5r0gZg9COFrnowKeg0c=;
        b=gBCsg7UknYk2itcdiX+hkOdMtM6Ktenx20x1wX3VfJ5bxivGq996cZGRA3t73x+VFp
         yGD1FFFUGSgb/TRuiuzcOcMQsPci+Ajb7gEV62dz9mwnxVULqnweJr1oTCIqxpjuFeo9
         z/+c6Z9doYK0ir/vhYAMDMQvl/jsU8xNMAEfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484031; x=1783088831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7quUvcamcA3KqanUCH5Z42n5r0gZg9COFrnowKeg0c=;
        b=H043UOf6Ct2ApXl/5C8MkxzsO1cw7wHKJ416LjT0vFCH5O1MU9tXsrzBf4xcDuhh8L
         BLUW7ZyHzbP/8X7qI1c/ZpIwX4igPStfaMje9qGdPYxunh1sXQMtVMUoY+P/+H/0/dK5
         2Kt0aX9ZhrJ3IpH2s4rMyor+ywmgOQIBxFHTKClE4GmeLnE1fri7aig7ZiXoNKc+2AMT
         cWilvO2h7aDAPRncQGkrPW79102hwBsNNMpjLE5/2D1P55/QrKOViKY+pDP9s/eXa/HC
         ePQ8BX3PMvqDhQUjcxHeej89xzAuaxPESxnZUGhNnEE3zw2O0FoaK7Xvf5w6RZbcZy4E
         F+lQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqj6U2hrW/EbgMU0nEbwLIcXYcOpyywwa7FGrmqpb/+NvnIaTqIsL+ntrdUOEYir2UG0NkwtBL/Mlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0Fur8oipw4FJLppC/uY462ACbjSG7NbtcP2Uj+n1pVPU4BqL
	0rbzwPu+gNoao+j9b1hJbtWcjKCvRB3m5xKKzkdGMyQtNVGn4On/0alGVUmEDaOqGg==
X-Gm-Gg: AfdE7cmjNsWLNSfD1gwqCFgSFpiZ0XMcF1mP8924e44ZjPAt1kdEflyBTExw32nhmgQ
	71enrfPWVl9mI+Hsw58dnQOu9Ea+7Gv/TEeIB/UC5hwRMxErJayZJqtPJ7SS65HjYxgN8JmGPV1
	JcRLqCSByf/wZMo9FEVrhtWr29HWybGbKllNeuwYPeErFqVQi7qnu6F2ARhIoswlR9okFE6BZEF
	YoreEONDRvaQuKn6KIm8REt4TqmQ6eZknNkyaXTqNs6izRFC/ZlPYuwrlI9CliC0GMHF0XRb/Y5
	Xi3N0EOUdc7o1E2t2/Lnd1HsqKugD6bTSInNy7YUBwe9A1GVfFdwzTp8GghyT7KKXGDloCE4CPb
	EGDaZ7YnI+b3O2xGHdj1mascLUst0lVo/L7CBHAyQyo194Qk8dkPq3D6J9GeoRCdbC7q7UFZiBY
	m7aOHERbIWdG2YqO2stZOO2ueBKZN3dLVFJELPVDgBVq/+gKiGD/vvNFeEyHifP8Lo59P5MrXib
	5/45Au7yg==
X-Received: by 2002:a17:906:7316:b0:c12:2705:5a3f with SMTP id a640c23a62f3a-c1227056ccfmr170987566b.5.1782484031265;
        Fri, 26 Jun 2026 07:27:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba6787sm355968666b.6.2026.06.26.07.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 07:27:10 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 2/3] usb: typec: thunderbolt: Check cable altmode support
Date: Fri, 26 Jun 2026 14:27:01 +0000
Message-ID: <20260626142702.1941182-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626142702.1941182-1-akuchynski@chromium.org>
References: <20260626142702.1941182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the probe function to utilize the new
typec_cable_altmode_unsupported() helper. If the cable doesn't support
Thunderbolt altmode, don't initialize altmode_ops and prevent altmode
from being activated.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 32250b94262a9..2eccdddf1b1f4 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -284,6 +284,10 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 
 	alt->desc = "Thunderbolt3";
 	typec_altmode_set_drvdata(alt, tbt);
+
+	if (typec_cable_altmode_unsupported(alt))
+		return 0;
+
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
 	if (!alt->mode_selection && tbt_ready(alt)) {
-- 
2.55.0.rc0.799.gd6f94ed593-goog

