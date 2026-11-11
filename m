Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393460;
	b=cpEp1H/cTupSZhpsIvnP7HLsV7of+iyF2PIizMxFKp5gTbNqiPkXG4QNYaHNCc3iJbNl
	 /ayYDjCmhDShSVuDiaWvxfmuf7AG3RoPd2rie0wIhknnlPL+W9e+A8D2t5u+rw1/lXtV1
	 JgzDqaQGTl7SMFP9201mcseJJNPQzzN8LnqOrmByPIyIkscjWW+FMQVNP42fvAqJ0vVtA
	 FmwcA0TGVHcSTCITvw1ASbUglo60H9fdlZLfwyCgnxEE361rUZFv/r7Gs116yt5LQPEWS
	 hM+oXWaUOiOHVSOFTfQxCSbv56mOmyuXlJZNab23NvFKYydKCZWwCZKVc5XmJcIE9pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
	b=tFCVhN8/OzLckNmapriLxePf+EYRjY2Q/Y9BGLCNgQJ/zwn05dFOlioka4kN9jZFMOPE
	 VVlvpi2IJz+KtUCfw0MdoV38TJ6i1xKyBjS0VqsnxeowmQ9uElUFHXX5AuKUTg/10TKLK
	 no7XbGvnxFfQsi0QuF5Nd71VIW1Sud5/g09u9OKfX+/8FnkhoMkODymttbT0tSkbXJ5tX
	 dQ7xNXzjf8NZT0FsCBvcjx70FXMfoEAktyEMAttI2eoTmNdoN9RkjlKYlun+tE6cUuw2l
	 8fBDi5mf0OAbVeFOAN+jLp+VetR8uXlQyQhlCRz0BW2lxjg/Kg+wkoc0UP2cbo8qwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IQrdNLmU;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4C606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 10:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F4C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IQrdNLmU
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so4682229c88.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794393459; x=1794998259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
        b=IQrdNLmUkTb0QulDRJPXkTLdVZNJIHZmsCFZg8DmIwe8hOHt38+G1g4Gh8LFJ9XZgX
         ckC1QGiDDqplvyYcReSFKBteQ1ervRy/byGtlQgUftKiu9gTWV2veG1eBb6ffpt0EYXv
         4u7c+oCWTKeV9N4W56wNzW5TO0y3fmyAkqTK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393459; x=1794998259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOsEgmtZ69SxpFbETr57+D9pSIer3EWHG4MXYrOTcB4=;
        b=0NpTYX94aEigvGG9Hi7DUmbVEL96lVhuGQzu9x+ANjkZg+nT/Bi9BTE7KLd3+bpAxQ
         CCAIhd0uhHUifNoC1p9Zdm95Z3WBMkiIv4EOknWPr+4W6o+jHLSNZn/9PdlYdVb+AMJY
         utwjdVMGPqtcIScuwbZ+2wT3Yb7uF0gz8komaUltEkh0dCCvbAHcgKwB4esAfAuStLGI
         HZySAa5vpsxMI51F48wsl0yh8SOhRGT7omcwgZHtGINPLklEEkEmN1rCpc0ZS551AKFU
         vAnXb0EauwUpN5bPYP3wysuX8aa7H5Xar159O79y1mTxlMsDczF6aaeeBLhuDxmw8vEl
         nHKw==
X-Forwarded-Encrypted: i=1; AL+hErF9O9O6K7BvuJktuocOLTnIhPJi2ENALvUamSczJyIb34MQZxlemI5a8Rmjq+c3E5Pl+AqE7GNDTqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z88+hBtom2Ick3kEdKHqTV5XDLBMFYTcEptkVM9NHEemiC6stnK
	mCDMnc1q6tY2d6nMVkNK1il6sjunVaW+G+6eE0I0uuhbCJN2h+8lfwj6sZKGb8ufgg==
X-Gm-Gg: AYBFou1tJFEnRqNWv4203EnvYFIy24x0SUilUTHXkcn0DyqrvXWeZmmBbecxf1KxgdV
	A1ytrdvWUTKJFG8y0WQLR8nzNO1sO5wrqxBWgUuGgZtXXOLWVJ4Aq1n8DiQ7MdUChisTLdUPpVg
	VuAx4fbOmU/h89Glty6jr2tc+3NIgJtAoCN9cg2jmnaI5DfOn0d6TBqglVaatfxOWcwCQgRb345
	a2JJQBiw8zA3X2p6G7xU9uIx+aXp1vwKOxSMA7vkzBKJaFdkRp+mDuRgl6B+zq6kLk/T8iEzgcU
	REy/80IQaLEDzuc4K9zqUW4Y2EaaIem/+l59ns0YQeGhsXwVFD9MCISXClWIZInABuQPGrY0i5K
	CEvBDd8Muwpc1sqO1kWhh/WTaqNzzDIvAmCxfHKR7c3hxujbPhiq3UTqc3HwjnIeossE1pV9KDS
	iKRg4v5nO94lalEQO8OzG1p1p6aBIxwpzkJToRzXV5NHWqYaqYnrelVAipROISiYdnIFnsvLeTF
	WsnVZN5wxpwlqaYIYZB9RV00wLOLOayKtaseXqHbjqfuxSweUhOlMQ1T05PVzI2hoDRyTbvwc5Y
	bM62ZKMre5SomxOaKFxcdYnqa17Kgby1CrmaGzPhMsxzS3cUCvZNsgUTseWEPp6UTfsEfScAPu0
	I4fsuRnqJUlLFrGw0
X-Received: by 2002:a05:7023:a4c:b0:19d:6484:869f with SMTP id a92af1059eb24-1b3c02fcd46mr1947792c88.7.1794393459210;
        Wed, 11 Nov 2026 02:37:39 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com.com (61.14.81.34.bc.googleusercontent.com. [34.81.14.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm14735194c88.2.2026.11.11.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:37:38 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support
Date: Wed, 11 Nov 2026 18:36:11 +0800
Message-ID: <20261111103710.1393311-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds DT binding and onboard_usb_dev driver support for the
Genesys Logic GL3525 hub controller.


Fei Shao (2):
  dt-bindings: usb: Add Genesys Logic GL3525 hub controller
  usb: misc: onboard_usb_dev: Add Genesys Logic GL3525 hub support

 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 4 ++++
 drivers/usb/misc/onboard_usb_dev.c                        | 2 ++
 drivers/usb/misc/onboard_usb_dev.h                        | 2 ++
 3 files changed, 8 insertions(+)

-- 
2.56.0.542.g3ef89b7020-goog

