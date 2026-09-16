Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3062B4F475A
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564656; cv=none; b=uWHjiFf1D+2ZbXzhwzYFFSml/YoATUlm7vIImwUCmVyx7/EPn9FGoRqYv5h4wkBo/yF5TpsaHwwXKXfJfCwW3rDsnCWNjN10hD51wvwzDJkenj6jw+IEOLL5423/b7H8x/WZZlVLyARjwzaCimyC+GQFpqPsDiwCVJ0LP9PiTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564656; c=relaxed/simple;
	bh=CXX9URqJmc7IFXYtcQQlMBrPAg+8dvWmGpMNcSvL3UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMot1rfzM1r0IsN1ModOEJWTGJ+zNPkbH7A2Sb3s4ohiR+FGxsuZrrflCw6bGfnvyNqssxcROIDZ71+CmDTJr9WrpTuweFjy05+t5IM1IoUrGMCjU8dlLDoKTX8RMKKTgXzGrbIxRzKfaLQD0xmR4oRvj8FgAVTjF14Yv1sqRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvhyM+wZ; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvhyM+wZ"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f9dddd99so26993635ad.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564654; x=1790169454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmT+XIIHNkjRFN/iKN1t5nBo38HDaBtPvckmMtoWMvM=;
        b=RvhyM+wZ0oQ2Wn0aE0x/VscbnOqShwYy8/k2l5jahVBcvjmHhCWG3k9s//nhUugAEy
         5z6o818aASHaN8/QSmVwSUqLAdAu0eL/qBlfmbqBgfYIXul4FGeLNzkhQm0l+YUU2T0J
         4lxJqQoBN6X3EpPRKkqbHxD1j57EN6kqy5pJ7uxY4TP6uJ58cIMO1X2786vKpwrUPXr0
         R+CIf1Q6/HtLjypLRf956dNfA8RItt//WMo9WhD7abmaWsobX+CHl1jFhvgY0M7E3qbM
         eERMJfqEr6L+1MqCU9hhosaGi7HPMW/2FiUdbLeWlJaZWuHNPcsgtpi7i4Yz9rP1mVGw
         uBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564654; x=1790169454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nmT+XIIHNkjRFN/iKN1t5nBo38HDaBtPvckmMtoWMvM=;
        b=tzxvcclEMArKaVxAkkQsHAHn4ZXLU364D3a4ssqgS1rsQaboB3EBPZSL0L6DQTKlYq
         STpIqr6pNaU+xmvSs8YdPToRmYFR8e/PWsJLFQ71FiU0O7P78gAR8AaK1sGrVPV5G/Ei
         WEB+CA9zIznykh6aX+rYepwnFnX7N6TTjFa2n8RInfS7tFUAt5tcDrP+dnClihSdF44O
         P1k15U4tBxPbS2nMxU1BU7r1MPLn9bM9MZGQcT5naTW8ZwJr4cI+oAyGBU7xDxfx+ZjA
         cHyeDfmmK4GMUE8349iYNsk5t0pWZ7MrHMQAGE77ai/Ol76rIB+gBSdNSDz22TPOve7T
         vNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2LVXofXgJ94LpQGEcrQToWjJgt8bUaSrnIY1EIbjHI5rfLnAOxj1Dg6SHTfkMs8HHIWBJbdtvCDY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxrfQQRv11ZL4P7SSsruWHE8Onl7Aldhb2XW0mpRwEvKPRamIT
	5117XcB9K4yYqb61BW7puK2lIwOslxKpx04FlT2jU6wrbtj/UhDsDq+w
X-Gm-Gg: AYBFou19a/Fqid4nkPunp+JRAD+9zuexl0uHaZJTSIjT1+kIASHss7NHFFlwMJYNQx7
	gzlgm67CjcpPd5VsAkyX9hPlJOKeRcjPQMpoPnC8XgncFykC97WajpO2zavCwadnLS5QNGsalaa
	n2mYIiBkeZ/2OG11BVq0scAm9iHTb+RlbNLYTNprCHpPOY2lel+SNqqPvSFOT7+7gjSbv2hBnDQ
	M58ypAE8JHxl61H5rq4gO7vsMxtH1D8fi8+h5UJGoEjzIn3FkfcSZ/xXjvWZMIhkl6UcwC8J2hN
	+KWIANe1EjcPEuimkXkTAAhaMbqa/66poaM9ILOE4Ww5nHXOf/2rk3r62/DHxrw0LC2PVrPs0bt
	jchAKRlvVuT8meIisRW9gjwmNh0uFjKJNjC9racYJFYjRPJF7VzfHCs+YO1IhwgKbL3nxkyeddQ
	QiY4QYV0rS1TS9RLu4RX4VxzCIKd6uOfxb76GklCFqkjtw926UdreANnskaY0+c0ze6ovHnEtXR
	qS2GgUc6q/C8JmDJgb1sxb33wqMmAaUkDlbgSFp
X-Received: by 2002:a17:90a:58f:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e21a761damr4062675a91.3.1789564653899;
        Wed, 16 Sep 2026 06:17:33 -0700 (PDT)
Received: from localhost (230.161.92.34.bc.googleusercontent.com. [34.92.161.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbfdd49sm5249035a91.11.2026.09.16.06.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:17:33 -0700 (PDT)
From: EricLin <ericlin050914@gmail.com>
To: michal.pecio@gmail.com
Cc: ericlin050914@gmail.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com,
	mathias.nyman@linux.intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige 16 Flip AI+ C3MTG
Date: Wed, 16 Sep 2026 21:17:30 +0800
Message-ID: <20260916131730.5522-1-ericlin050914@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911222137.6639b397.michal.pecio@gmail.com>
References: <20260911222137.6639b397.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late reply

> Hi,

> Your log looks like they work - nothing is being suspended anymore ;)

> Do you have any idea what kernel driver (try lsusb -tv) or userspace
> software is using this device? It's quite possible that the driver
> simply requests a reset explicitly, either as a matter of routine or
> to recover from some problems.

I'm using fprint to operate this fingerprint sensor

Here are the outputs of lsusb -tv

/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 006: Dev 002, If 0, Class=Vendor Specific Class, Driver=[none], 12M
        ID 27c6:6090 Shenzhen Goodix Technology Co.,Ltd.
    |__ Port 007: Dev 003, If 0, Class=Video, Driver=uvcvideo, 480M
        ID 5986:11cc Bison Electronics Inc.
    |__ Port 007: Dev 003, If 1, Class=Video, Driver=uvcvideo, 480M
        ID 5986:11cc Bison Electronics Inc.
    |__ Port 007: Dev 003, If 2, Class=Video, Driver=uvcvideo, 480M
        ID 5986:11cc Bison Electronics Inc.
    |__ Port 007: Dev 003, If 3, Class=Video, Driver=uvcvideo, 480M
        ID 5986:11cc Bison Electronics Inc.
    |__ Port 007: Dev 003, If 4, Class=Human Interface Device, Driver=usbhid, 480M
        ID 5986:11cc Bison Electronics Inc.
    |__ Port 007: Dev 003, If 5, Class=Application Specific Interface, Driver=[none], 480M
        ID 5986:11cc Bison Electronics Inc.
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 20000M/x2
    ID 1d6b:0003 Linux Foundation 3.0 root hub

Best regards,
Eric
