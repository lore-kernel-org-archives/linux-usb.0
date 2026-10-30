Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365673;
	b=blyYmst3cf3yhdhKQD+2JlvwjSEBKhdTbwiIKbUlNfVVXXyjzK6xN1hLLg/0ujD0sfs/
	 IQMYz1oXtYzyzwseFbDF14miWOJisw/A52t1K2sdEEOtReVlad/3rTt9Laq6C2//XLMbf
	 cEs9oTQ1Us7VblIO50QCupQZPzt4rgK4T5rCdo0Pze7X0yOhj1NbmgEN21peceftbCYRQ
	 goM9mgcI7I7TXXb7d0vhKSkC7QSnvdpQD1c2J4csABJSXKHRfovoOda4keKWJP0xlJ/Jd
	 Sgqm411zZu3/pZ7d5NGacbOgWZoMAeLH+vcBc6XAmq46IVOAwbXYUk7ATsypEhSdUiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
	b=4IZ9r+djwYPCNSc/C043xf9gLZiuwgoyz+puDr5h9IBTk6oYbVKFfPgxFEg774CWVoN9
	 crMVcmfCKT5C2lvf7b74hRpRqhV/F3cNeoMkzYK4pH4FtO36EmBHbvWQ0xxcS0ZvBFhr5
	 rhEigNoxBEypMrVVNLuXCREkD6jw3jR8WjE2ZlFcGk/LV4qKRJEV7NgVe9G9hVNeAsqn+
	 vJs2xTJ+NXXWRKSCzoN0m71nIfDKiekveEhr6Nkk/arrzOajuxqEwMquxV7XSq8XFHtai
	 1z2f0rt9VrISM8pcIedOGZYzJ5JPbBkxGOGoxXNOhrGxHu3y+Uqc+fefpmtNeN9FADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kAsJs6id;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261B606A329
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 13:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0261B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kAsJs6id
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso418116a91.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793365667; x=1793970467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=kAsJs6idydB45DbKxh0swYdwPWoeUoz1fMSGuSg9Z10c1chhaLoD3NptrwkZkLa8WT
         MQDu5Iguv586MYJ7G0ZC8DGNqd1vZ0N9puv6NuMN80cQa1qur3iLqUZJRGjEIVUkhWKB
         7XrW5G3zFjWjGzpZl+GD78rr14kcNm2HU98isJRTU7hjAslGu5Cb30150/cSqUDwb523
         04wscuBw+kp8Y3+caUYCmfoq5q3eSp1K3mjObUOV7IAk7OaBJAhBvv1wK001+OnCURDa
         BnqqyFvr/lkDI0S8TIpcz+w1RWkBFKthZFRYkm57tJkBwAhVJdy67PyN30grm8vXRg7v
         Y+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365667; x=1793970467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VBqZNaxtB8zlZSrHdHu8zRInBozrHHy4u4axvoQIeWo=;
        b=1vUOoFGl7tX3EcRg7cyKMe4qNZhtJMxF1qycrRFomfkGAu/ZAirRZf+7w3CPcgFash
         jDwibEIbHZ3LJH3L8eiQZmh1Z1f+V6jsAj/8iCgcssy4thVfUG2ah1iwJSDUi3/pxzW2
         nFg/T1Oy1ZxjkdcSAfH7wksAImB8xHIoXxFObHssBtDEUvppouFNeAXYrPLbIuQVay6E
         +7od2RfVVfwZl3f1LbiyKsKT7sGD95K6BLH9D8m8tc4caiUBpdQJss2rzwgxGDzx/L1G
         KUErXbHRZ4UF5wgOvHK+lkR8cl888HPjTgEuF69xmGIYLGzaRzKjq4slZMSYAbFagidc
         nwuA==
X-Gm-Message-State: AFq9FYK8VoY6+z4MGAdlnHSwr3IcHK8dgGvwu9gyFIjp3FFAxBVajUTN
	Eh3b3XOmar0FfV6MKgc3xEVb0OoepuejDblAcSzoU2uEaOZZBGHS+B/m0lUZLWJrKQ==
X-Gm-Gg: AYBFou3h4qwOya7WaL7qDSA8wAu3VmMvVoxdy0qgzFI5iGCbFJbifJ4b1gq2T0JRAvX
	qLRJ2Pu0KYlE/FqCyQb16EJy7xt1UR1C8hsaPIxujM34rr3GD9C9YL+kLR2iioeJAV+ETVDr9Tq
	zWQC5X3bjXYuzl/3OAtRGkEj+MBe53laSeapce2aQkIHhOons05L/+m7V1PGexCcaaDIMUWqNS/
	L9Y/G9h71PgyPhWYnDT3CAu9IOk3lDJM7JhXtmpd4M7Mbr7yTj5oAwK4rj9T/rsKrtl0zltwNt8
	6Odh4X+nJK4hD5/Th0eVfRDgUvR5h510V09R0hN6kdZENdjSDvIKkU/enSoSVed25sm02QHEFxq
	8g9MZbBD5Glij7mxr7cKuBJ8lfUH8KF3V2Zj5BnGzZNmo6vPwjHQv6YGRmlysS4U2XjQ8yQo5dW
	qrtyD9xgbjAXib8O+pjh3ZC+TZD0K7RT7tNDaF4AtstF8R43bY3149KR2V3fpe13IaCNPUQTtyL
	EaQiRu4lcGEPBtsLz9rj4GC9xVH+q+1ybmWQehFgAR0r3SgqIcgaCftgSouS8HE6PdagacJZLgo
	FyfdfAGrSY7/vcy3gLM+x3sCrozVAgpK5qzF7lpCEV2npIulwPeUBSWnJoNcwolpffYDrId6L3C
	FH4qYvE/w61LtMgaO
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr1634562a91.48.1793365667017;
        Fri, 30 Oct 2026 06:07:47 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm8733413a91.0.2026.10.30.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:07:46 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 20:07:42 +0700
Message-ID: <20261030130742.3211592-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <10ad94b3-66db-49b5-95c6-3ce9090f3278@app.fastmail.com>
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

On Fri, 30 Oct 2026 13:24:49 +0100, Arnd Bergmann wrote:
> It sounds like the underlying problem should be fixed elsewhere,
> possibly by preventing the deferred probe to be retried each time.

Hi Arnd,

Thanks for the feedback. It looks to me like it is probably possible to
fix this better in the USB core. I will attempt a v2 fix that does this.

James
