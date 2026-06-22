Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DD39EF2E
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121163; cv=none; b=E37hkjWGutg3tX9WvlWbu0ZZnfdbcRMs/zpH+NF3fqqlYBT9JxRIt5RLeQzwsQ/bOaZyvymityk+ssQWhvvVsuLvJiNSzfyX94vnlegOM7nL8W0Ke4i46+/Gzn4zJB9tRSKuN0TpQI+XnrjcOkzUGsEWPGFRatgwKNuJqTGDmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121163; c=relaxed/simple;
	bh=pEnvLxNvM5J1A5fMCVomDKG8H1yux7WD9ItUzyJByV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L16GPHgB/+pbpQ8W7DGml2uNG/82AU+LcK4g9fsksxl4ORlS1jgIV/a5XmTR+uDjtqEOwfi0evX7x13S3Ef/0++seZ8MWCZp4Lj8OFIEUrMUfbwSlfdjiJl53sZftkMb+keQBAQhhRWKIk3hY0s80DcFs9IPw8wHjpjn+cDt33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oCX5gHyz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oCX5gHyz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso239833466b.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782121160; x=1782725960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjCYLP4+ofFAg5vhutdqer8GrUd26XTKlWXf2ldvBws=;
        b=oCX5gHyz7LOIu5tKHq5kLD0PhZbfbQtM+42A8b3R28lxnST13NaJlIwdCxrEn29Gu5
         khz46hIQtv2RIKanLaZ4pr2sXQpH++aaSnxUgvER80+H52d6+57hXO6fYLkeasvlAsjw
         mTrHk0tR6qHDu3G0YmOu3/LlMNMgZW2jmvG+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121160; x=1782725960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjCYLP4+ofFAg5vhutdqer8GrUd26XTKlWXf2ldvBws=;
        b=SiiAOqYgdUG4AvbOPSAHrKL7IQD82rN5bJ4q+Am2q0i2OzDXvxe35bwtTk/vBG/lnj
         Kp95FBEaMxjylXQ7gXNp4KSzRyuCoAuAP7kjtasN5jLb1b2QgnaIgWPA9pM2hU548Jro
         unXZ+3HnhgbxHliXGD0ez0TX8QweWPeChuNFHG1VAn3YyorDLbjctJIR3oAsnAOu9Dm3
         He2NxFmAAWGCkUci5jV8EfgumYuisWT71qH/35/TR/ETGkfcUqKk0HKv7vghPSWi5DBk
         +7WpHYCG7Ntj9rlHafcTyQz9Jc6YB6ZDOTp8q4XvroId6UcypzetzXF4WgxAv3oiSzs2
         xxwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QghGxCzFAq3aSYxL89e6Z3ZUxZL0zCC5MeEIk77rDROYVRG3QVpJebwrUGR4gsaEc4+Z9CJea6wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTfESJ94ao2cvmW+W0mXipE6r2YBt8relq2Ds9PkSvjhoXrbd5
	anbQpQ13eFDrPGSw+iof3aT+1WesV8H78+MC7xSt26+Q0cutF4jtBCAd+5mVLqhqzw==
X-Gm-Gg: AfdE7cmCvBOzX+IudS1b4cAk4NnyPS8F5KQ+gyuWhbRmrvazKCl+nvjp+Y+blmaDMKb
	YTONW6Nv0IhdXZDdsmLLSiB9FkyfGZdgOwuqPULTQtXgyYmfHvCeQzmiYxGkQhP8fo5CS1Ke0Db
	0coZs4xgn5nPonR3AYG8MSDW8yrynkyYyWJOXHXzkTn6kAihf64+Jucm8tqKwUxSjsl3rr7vCi+
	tbpU8vqj0t3+caHRqR21xTXnMB7svCeLyHtBAqld9XWqc8or4NlqDq2O6I2EclfJwvMljgtFXGY
	SWbpZBvI5hiZTSulpvaWM7kvSUQmw02eEvmJKvb59VneGXiUyUVeF2dcGF7mJFfui1uRjM/g6+H
	prny0QJxkPfxAnskBR3Da0jBLGv4TY8essPz9SGxHQne3m9Rl5HIfYbxL1SF6JSgMxz/GdN1Ze+
	QinoHhBH5579LiJpAF/CQkQnKzbV1mihBbANPJuLhEH4ss7aQP7Se4fs+pkkKTrOSkZnweKCUDI
	uq56AoJ1A==
X-Received: by 2002:a17:907:944b:b0:c08:3d44:aab6 with SMTP id a640c23a62f3a-c097ade3321mr664592466b.14.1782121159578;
        Mon, 22 Jun 2026 02:39:19 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e526asm324855566b.51.2026.06.22.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:39:19 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 2/3] usb: typec: thunderbolt: Check cable altmode support
Date: Mon, 22 Jun 2026 09:39:09 +0000
Message-ID: <20260622093910.1210089-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
In-Reply-To: <20260622093910.1210089-1-akuchynski@chromium.org>
References: <20260622093910.1210089-1-akuchynski@chromium.org>
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
2.55.0.rc0.738.g0c8ab3ebcc-goog

