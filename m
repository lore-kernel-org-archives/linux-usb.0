Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019006;
	b=3J+a3HF1xj7xFKtOdv1kW8vg332Zsbzb2zd5DtvUtA9bZ6iT7QihCO+dCUCIqinq5ZjO
	 S2tlXR00mzB2qJI/Ik49HkXzaZVNQgB53x1EoFb9mnGZpkE5aeRauLhplv16LR7Wm9YIL
	 Xxn/X3XmGRYII5ptL5oFgrKo0w2v54JFkdM+1K527h2dDO9AwnOmyTo9Ocso4H0M7+S45
	 fnJvWuamdDiQ9YkLc3Xd+pgYqUJe7jRE7SQFBctt0BEqlTKEAcvqJsWTt1GLonU78z22r
	 QBlj3mzYVhbBZsINapxW5FF0ew8so9uipvrMpGKzcdisNxw4tlb14adacdTc7ALEGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
	b=H7dIu7foiv1dRw/cT2UnXNLP94h8Nui8/NTqeHz4Gvl9rIr0TsjL+6bETWHZifIIEKb7
	 EshWrdWG3F26EKWUkIjTSxx97eQQJ2TJ1IgYUNPvhMYQAbMP2BzQggfgQjxeOgVLO4TWb
	 Vm4FkPjoVo06Js5RQWejDWMfnFvIVW4gusALOXkCXMe1HLRFVCm26+tJQE+djff8NlOOD
	 tg6EA6j35N9PHi1uqSTsTbvr5ytfoHcKbE1690TtLVtM1I7J3lhAe0LXaYazyNTFoafk0
	 PJe1GH8FxJqnKbX/PJSgSkp5faaMnuerpvHn9a6zBsk3c4lq5jxojXtXPRxrmbhwV2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JkscqRq+;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D81606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D81606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JkscqRq+
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1641525eec.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 18:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019005; x=1794623805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=JkscqRq++B+ptNom9a+L3m4CpRfjH6yEuM7WWVpDw0YRYMkSl78OdWOLv8mfU2y98L
         52LmMy5Dy5XuXc64jwh540/dpl2ydJeie+ubyx7da7xcB8m1Y7nkdechckpqrqWw9Q2l
         o9k8yxCMFzhuIlzGc8lCG7zzknmVDAQmVEYnVSOu9or68qsXVSCRTIi4Cr5d1Rx/a+O/
         aWEVheAe+0yT2Z/r5cFzPt1BEn9cN1MuDIv+xiqdTeVhYz0/RpOyJos/pZCqQbeNKCD4
         TNIPN0OOsMA0QaG/R9juiSMHAC8ie4bUIeEnKn0lHS1xgH3XZuMIN8L4DZNZWuegBmnZ
         e5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019005; x=1794623805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=y7KteLZBmpHyE37xq54HZ4Qe51O49sLXi1gUdcuR4kBpW2btj83s9XdkZkAscP/imL
         W1sFC63n7KrXjck6LDpLPk2OVhZpkIQJGUPkGE6ca4NsH2zqlSCEVrYJY1Fbh4B8EMjM
         jAb7Hjj2nvF4Lqv3ZeG/NwsVCkwWQ0zhF1dEh/xZs87CmE5tNz5Lr7coPGnlU/k8oGh4
         UAx1k1p4BtmA+LRSS+oHAGj9EX/Mv9f4mEO0qhwXm/CcSfkoPYOLAPBGSiJs1M4LgBlA
         b738zOsWk/cbLLLnz4sZTgQvlhvgolvLp8cCaiWMa95aTr71hqeJAXK/FGQqPkabm7Rj
         TBKA==
X-Forwarded-Encrypted: i=1; AL+hErErz6KmNNbrhV4zO/63bdNSS1jLZMk5CAKnmwYkJNP4rvClQg8nCu39S2GdhwaxxnJL1d4+YTPNhN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z92bXmoc5BusfOKcq8aOlnN4P/fwK39GT/dUVLB7ibv7sS5Uv1D
	kxMzi6tZKPH7X56S3HNVeKzrAzDXKs3O8kJTsKqr0aO7InIyP88c0WBcNF91jNT0MQ==
X-Gm-Gg: AYBFou3/SIvBze65Vq+NAsbJ938R7vGv9sIybAmdun+UrleFIAAh/P75Hl68NUhfx+Z
	MfxiBMynb78UU6sPUkF/DFVWlSe++dnfp/XUbBSM3tgdZw1YWTon8/OVQqBMVSq/Cc5Wcg0YWA8
	4FLO8PFoWP3lA2Tjm7B6zVmo6WwEayh4Kyo8B4WGjPNaKyk1DjnSteVnN6/q60DaE/z+efgdSKe
	EieK0n5lvGrbv/4H7Wu9zIXe910MSGEtHQo6279aL80ApWTq58zCDVnljW45mFcJ7rNY7kq2/oU
	/KpW3cWxcf11t4Ycq42JaHnfHh5E41UudDuvwYnxWQWCNibrDv9eKhlp9l/A48i/0JkvsFRIbhe
	XybvXrrbhP0/7BSdBaEe4t8w1sxvJNEqSgtwxXgbxLGGQ15PmTjfgwFrQPFBchEyjIBja/3WHPp
	ykiMQnMa4TTeogPbpHqsj6iVl9ELqCJ2osu2yAFfjP+Eh9WNc0s3QbjKV8ltEqm0E0Q/2bQx0qd
	3MujUf7QgAdcFO5t1SXnGjGb7tpBskbOtz3yoLgpcem0BHDbt77UPoFk+lZNzOIt7TAHxJUFiCD
	wsQakceCw0EItYwSvNcA15mYbYXMsxuCWHZYprL5rc4mN+dB9vRkCfk7nwVPzAOVg4VkuF7QWvB
	OsPGU7x/fq/vuKGcIVzQ=
X-Received: by 2002:a05:7300:4fa6:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-36fb6a9164dmr5030384eec.19.1794019004825;
        Fri, 06 Nov 2026 18:36:44 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:43 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:36 +0700
Message-ID: <cover.1794018128.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

Following Johan Hovold's suggestion [1], patch 1 exports the generic
driver's operations, and patch 2 changes onboard_usb_dev to call them
itself instead of setting generic_subclass, so that it can defer probing
before the device is configured.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.
With the peer-hub property removed from one hub's node, that hub binds
to the generic driver.

I used an LLM coding assistant to help prepare this series.

Changes in v5:
- Patch 1: added Alan's Acked-by
- Patch 2: stopped matching a device that has no platform device, so
  that the generic driver binds it (Sashiko)
- Link to v4: https://lore.kernel.org/all/cover.1793941292.git.jjc@jclark.com/

Changes in v4:
- Switched to calling the generic driver's operations from
  onboard_usb_dev, instead of adding pre_probe to the USB core
- Link to v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/

Changes in v3:
- Added a patch fixing existing problems in usb_probe_device() (Alan)
- Link to v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/

Changes in v2:
- Switched to adding a pre_probe callback to the USB core (Johan)
- Link to v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++
 drivers/usb/core/usb.h             |  6 ---
 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 include/linux/usb.h                | 10 ++++-
 4 files changed, 61 insertions(+), 26 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

