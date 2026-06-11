Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4CB3F1AD3
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180523; cv=none; b=XAoL8GRfeu4QuEFCpa0q/F0V1FSRUDTrTsCCZoypbzV5AS3RkeDFmXcRCc5dj9/cZCApY0VALbYTBAvCGwygrQ4PhS1ZJiQPYF//yB0LQ6YRnYFhrulIt37R/EEpWkk8DibXPlb+Vh+u58dUP/9DdZxf1D2RVmymlt+2CsUhseo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180523; c=relaxed/simple;
	bh=rlVEvN8AKrCOAcZ5viV3/6WunbCq9BordabSvtTgvDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fm16v6mQelMhJF3KpmnuoHR5gBDD026ypUyIasX5YsTL0kNW4enChPMHJAc4rG6H0PMqo83lbkMLCDeweUt5ExTB6mPA2W3HvlfYpfI128XhtGN9PGY0BHHsm25XBK2YUiPEugEpC5WWF6G5g7ytO5JKTuMle5Ce/S11uIuJ/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cbbohhoe; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cbbohhoe"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso8965631a12.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781180516; x=1781785316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IaRwGvDQNNjjh2aYW774LU5lCmZqxDEMyKfTsqYWg8=;
        b=cbbohhoeLazjpBexjAp63LtdcSo0FssLX+CyYMXoFCl6dB91UWHmcn5wXSWCDv6ygm
         rQgMNkBTvh6lNC7Z9Og+B4ksEW78uvBH7dyS2EOKtC3BnLuWeat5019hjyZA1cKEs2j5
         85PBzU+Y6mv8VwUgXDPbWk/65mDuBDaEtLiuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180516; x=1781785316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IaRwGvDQNNjjh2aYW774LU5lCmZqxDEMyKfTsqYWg8=;
        b=ZfXfhgjRFChVaU/+zyHoPR1K11m6I9zl24GR7F5DnRPzexRCbDT1i7JItwn63bpl+j
         O2hqy1GFE1yTiefZRx10TLcd5OEeFT8HDLyHKSuFNAy3mmWv1b16fibA0Cq9Ow/Rlz3c
         S1CiXa3Q4biPmmyN+udGUY3xVRfuX8YYs6aLckx5XsVFiEEPdQwV+npe3jlfrS0GrNvE
         GtLb2mAQD2bzbqPey72eI0NPh0y0A3wyDTx8JfcDgorNJVbHbCRsHRvm6mZ555Mi6+2w
         GV5gI2FWNrL6d5laV8O1tVyaJIUpkMgUlezmhejIK7VaHBb9NHtJTLhUX0/BSV4OHNRx
         5Yrg==
X-Forwarded-Encrypted: i=1; AFNElJ++FfdlvIv8juSclukLjStO45AujkZjctCmL5gZKhZUpgBLVWUUnMuV988wyrMBSW0XWSKrwm9vSto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zOzoSenCFdm2yk0DoLSamufnaSPgBx0O8CcYDbPzxC84cSho
	sX1xxra/tIS4hDfsA/xGT6L1tfi6UZ03R3RcRvb9RRkQg8/svxeGQL2iMT1TQNQLdTY9WfQbrU1
	NXFY=
X-Gm-Gg: Acq92OEzbr511mmN4ZFyMRQsAZTwMDKSiaUCuAd9BKuCUdRLSp0za3kLen392sTXoyh
	hg8bt89AgFzs0P14RHQ/ApMDke7cnsU+s17jT7swl9Blh8NRcmLG0T6F7bnv/KVO1eaKF3ckXQ1
	hOu42Exy5ezGDe5gYdMzYh3cJ3jahPTsq098BK6j4aOqR3c+sBiL3AZ6HMx9+bsL+VdfiOcOUXb
	Wu0b+clavrQQF7J/0/vU6ObcycvcbsED6TDhYd3vKlmGJXusBT8TZ1z13PTu/sd94Wae+oDHyAS
	6UyPp0Wmm0iykiJLXtVx4OFzLpi/lDOMl2b3Ll580BkJpYIk7262ar/obNuOetSzh18DUhbTruj
	qe+0F9IWh+nxlQRb78pwMtWZR9eu253xBeWjmFtYflkOXShKMXL8UIaI8qpyp0W5w8Apz1RbcFv
	QQBs7QqU6iAb3ysTwbpd5DWvFXoDGUnIdXl7sPc8oeOvxn66RN310XN8l0DbhIr0Bo4NGGKiUOD
	8hpsiX7CPfdV0P7sdr1gMC5KK1lFaNxbVmJEUT0nQ==
X-Received: by 2002:a05:6402:1f49:b0:68b:f026:f381 with SMTP id 4fb4d7f45d1cf-6930e290872mr1278153a12.8.1781180515849;
        Thu, 11 Jun 2026 05:21:55 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm6853113a12.29.2026.06.11.05.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:21:54 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 0/3] Restrict alternate modes based on cable capabilities
Date: Thu, 11 Jun 2026 12:21:43 +0000
Message-ID: <20260611122146.262184-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, alternate mode drivers (like DisplayPort and Thunderbolt)
automatically assign operational callbacks (`typec_altmode_set_ops`)
during probing, even if the underlying cable capabilities cannot support
them. This can lead to incorrectly advertised state configurations or
initialization failures later on.

The first patch introduces the core helper function, and the subsequent
patches update the DisplayPort and Thunderbolt altmode drivers to
utilize this check during their respective probe phases.

Andrei Kuchynski (3):
  usb: typec: Add helper to check cable altmode support
  usb: typec: thunderbolt: Check cable altmode support
  usb: typec: displayport: Check cable altmode support

 drivers/usb/typec/altmodes/displayport.c |  5 +++-
 drivers/usb/typec/altmodes/thunderbolt.c |  4 +++
 drivers/usb/typec/class.c                | 35 ++++++++++++++++++++++++
 include/linux/usb/typec.h                |  1 +
 4 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.54.0.1099.g489fc7bff1-goog

