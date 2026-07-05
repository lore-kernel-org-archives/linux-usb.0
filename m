Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B6233938
	for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783249476; cv=none; b=Knnr+2ZJXBU5HCIGz9WGTQKKR15hN/iQnn7UDJPLYxZOpf7HqXA4Gnv/6QWvljUIbtxLvjwzCmGUXP0l/kS4ZDSbgL2efVnwBiyrXfrB8Il0SkiT013F66rr33q2aEX1MaTxIAuCxbT2+MMirLmmPUgvfOwwG7lhx8NelZ1HxKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783249476; c=relaxed/simple;
	bh=IWJa7ugyyZplhLRVlElwMNT+I7rZrTz+UBLZF8clfhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrKutz8nZOKpFBHwu6adABvprdy5kYT4uhWh/4vOFIQ/ecDh1OJ+LlqcEsSu8phwxfJQrZxg4pk5hwRhgLTW2FRuyic6W9Xn3BoWQ1tPoSlCT8C93Q4wV8GwN74uTCfOqPGioHLVOReXcPRKmQHw5+wN7VW3Wl/qS4/XhNG4yYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRtH+YTY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRtH+YTY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c83474ddso19559365e9.3
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2026 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783249473; x=1783854273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IWJa7ugyyZplhLRVlElwMNT+I7rZrTz+UBLZF8clfhc=;
        b=LRtH+YTYVdBVB0Tm8yGebk/ibjwOb8efia4Nnk4G3tgqBkMnFbNSZuLZbzjjblzuuF
         YRknneM5FtG4hNZ36mDxhdVkSj2tbsf2/ii7lMvNnzdrJUxqkB3B8F5Rx7/Fyu6qXrqY
         KvvPOfgoF5Kx4xZBBgRTNK9L37G6681ex0IUhPdMHG4z1aJVlOAXQXFWJZOqWQpSjacV
         wciUb6bvlZY5+pOiVGOeoEPHjjOKxaK1AVHEu3be8+c8XWWRWbEgA9wgeQSmp28h4ue7
         rDtb8/E8IYvd0GUwj9JDcoShb68dmNNSA0o1Nv97RxSzaT7ijoWocWqK67EF9vktdLaf
         /i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783249473; x=1783854273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWJa7ugyyZplhLRVlElwMNT+I7rZrTz+UBLZF8clfhc=;
        b=SNWMRx4f0Rp5sCU0B9QxptdmKK36wueNFY94LCxMvoeZc5Xg67nDJccCjVfiQjRlMK
         xu0mPu6GlFOc87m+UWkJNFozULASuWxrlymusTY+bWxBly/t8uu2/0Yuo1dceVQIVbps
         N+7Z1OM+XDxOU726oz4XnPgPVDKpyfKxRtVCw83zJ3JTRgRs4etvzOHA5Wd2hCc4kNjc
         gvySVnWHaI5yYiLhMVUjzHFnyVe4Wu/MahrpZOeX/AcXBWsppUuzMOZz9aJTKNRlNqyd
         IMywqmWBMVhdF8onW/VJ5YzwJUGbD3FLpI7xuNdiTHVnRPkyulcT972Zo3r9elXtzLEz
         0J5g==
X-Gm-Message-State: AOJu0YyvLS8FOdXB3Fmnljf6t46YdnxXAAzRTzvNs4S4U5dkyRPZ4zO3
	LohyyrzIJswZS9OUk9M/dL5DvEChgiQcOvb7PCByph6S0Zu0n0maV4pnL2vYxFtDyP8=
X-Gm-Gg: AfdE7cnR/9MdeYidvml/lfWVcprIcsS9sBUOXDws62nzYZQ81Wgs5N0FmO0djsM2wPO
	40d2fXviouqvuaTMM8oF8iJmLe+ASRApW5Vm3KxhusH7vwFKgHWYvu7eShjN3SLfuXDioFaHIdk
	FEioLIw00IH4IEcqS0Ex68B4O8wusvUZU9SHEhkwcykpAmnMhWRsBmTeaFDRwFbJ2pvQSc9rugx
	mpABfAT+VqgLeNrcEWMUU/MtN4bbo8wSFG+1W9FxMMmEX+CS8S9DqH1wBOztsEqLgIBcbKPKmwQ
	LA5XmMwpKwmqeqAoasu2G5G/q19SyNVMUX5O7HxIfNZUYt6mf+TGB2MPT2xmazKaOPPNmAjgcJc
	Nc/HQkzV2MVi/6KSgxhiTd6h0yTxIUtp+tpU6otocr+HzC1wgdoSh19+3ZvXzW2oV4N/bdbFvb9
	qRuMmny2I5lgvUTIqfLxPSuvDmIZpFwg1KEgfY0r7aiqOlU2pFiczTI+ci78DXD4viaUeoJe/Um
	+/moBLL
X-Received: by 2002:a05:600c:2314:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493d11f6f7bmr47671565e9.29.1783249472812;
        Sun, 05 Jul 2026 04:04:32 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636e9e9sm269974845e9.2.2026.07.05.04.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 04:04:31 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <7640db1f-a7fd-46ca-8f2b-b0f6b6d90098@gmail.com>
Date: Sun, 5 Jul 2026 12:04:30 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Xu Yang
 <xu.yang_2@oss.nxp.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260705065832.184-1-kernel@airkyi.com>
 <af9b60de-ff6e-433f-a757-ed7e1dca6caf@gmail.com>
 <6bb87b1f-6877-45bd-a140-48536503259f@rock-chips.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <6bb87b1f-6877-45bd-a140-48536503259f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Chaoyi,

On 7/5/26 10:37, Chaoyi Chen wrote:
> I think this is reasonable, as x86 works fine without DRM_AUX_HPD_BRIDGE.

Understood, thank you for clarifying.

I think this patch needs a v3 as the commit message and title no
longer match what the patch does and would make the commit history
confusing. Also, in the next version, could you add the changelog and
links to each previous revision below the '---'?

Finally, a link to the original conversation that led to this patch
would be good to add to the body:
https://lore.kernel.org/all/b2633b22-da30-4778-8e23-7b5bed9ead07@rock-chips.com/

Then I will give you my reviewed-by :)

- Julian Braha
