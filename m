Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469695293F5
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 13:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169930; cv=none; b=WDymbRj5d2SsxqC10TUR76/NIzLGevTW7bI6mjg9Ktaw7jsozbBTFSwgTNv289eMThFlRDpDCoZkdJvXD1N7sh41yqvvsAA7Xjf91X2/k/nb/22ewBvYopeKHSEvzwi04okg+k3ZgToM9idV3c9Pbd9rd6lqax75WJ2gdphTR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169930; c=relaxed/simple;
	bh=eX0EMAdgzlWJwq/2HWNye7UTxaEWtnJ84b/9Qdva1sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNx+3eL0fhM/nXRm3BkmEXWJXMMJPHcP7J12GhtDO0M3mhiGmOhiqv3GIxL2JgwySus9w0cpu20GUrx88bqCkOL9/Q9RkF3yiWS05WjBTqoKNei6txpfQLHAJ7iwbPgg3HNF3d+lLuawqaWOLc05egBA9yGBSBMwtBFOdWbdpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=emWUySjX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="emWUySjX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so4875225e9.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790169924; x=1790774724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbqTmyvAXsPMX/OWViL/BojYfy+amNPgcnI6jZ+rUSM=;
        b=emWUySjXpygiP1Cinddy3IujnpvW/szmXnkSAEud46C53jhYg7ViBXVS5UyQ5cFC2I
         e60tTwLNoPmL1VTNRJShtJzMZQIyIEnBnjqYmzQ0S9Khv0WxTj2pBzLw8WwWxu9Kb9sX
         pmdWFd7egf3UI5sbjkjgYP3CqkHpkf1K+PzuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169924; x=1790774724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbqTmyvAXsPMX/OWViL/BojYfy+amNPgcnI6jZ+rUSM=;
        b=G8zYPwrf5g8yGSLf4OSLMMUXv9uQe7LWEydmCDyccuuaxpMhqZkLEaEIgFs6Phzk0q
         JHAKBdZ7Sh7Ou3MtU4pZJy0t2u/mEe9VJrjxe6I+/+60hfW+2LDdC1GeWqb8onmmuBDT
         u3ypVlsPKnseDD8cQNRTkNnA8JHQk6qXvrfOmNk6pVR1sNmQ0Exl8qQvQy08jyBe32Qx
         xgr1RwxoH1gg46yJyGtQqTcrQuqruULVQuetcBNCAab5/FWV6BFSFXJr50k8bv3M6++8
         m3xoxY6NwY/Iu2C7SNyT5ME3kfFRlo2DOod0g/8zzi00OqEEcdREuGyTTLOnv8E2Eihw
         6FqA==
X-Forwarded-Encrypted: i=1; AKwUvBzEYxk/M2mfN6wjbIwJqifXoryffN/jSEt3ss7ekU7G0ksZrKR7ylt2QL9YtWHuEWWRTBAD55ZKuiU=@vger.kernel.org
X-Gm-Message-State: AFuF++n0rdcAWHIrZiWkHaVUdvRq9phVbAEEV2oq0fPxCnTKKnU6tfVv
	epX0HpwCFzhx3Jek5GNXF5TlLDFje38m8LuTnSQY/bGQyWLAjfFlvoYk4JSzErd+938=
X-Gm-Gg: AYBFou1FisCd3MHs7BHgV32+S4Aru+omBsMdY9rqXWv/5kwzNGOahqcy7TE5hdvYy6p
	2lfbz+5tjCoZOooeLPhC/RfLnUM4FWCV9MEf/uk4wMbCfuGTLcLymEXUJsQoGfZxDX4hc/7Ueja
	KikmlCt1Gn+nHEJxvkZMwNns4LDV4F2OIEyFRXYOuVaK+1QBst9JHLvQ2z1vP/U8kkTCmVjYmFO
	nnpBxolPjh3+Iv0KsMC4hzXWbWhWUf/xJYdBA04+A6DuuRneGq5SHDZUsa0TH78/hkjERo3tHRs
	mq9aV5uZWtac6m7TkYLuwIRWJxf+z45ZbGLtgutrx5rv9P5plxBv+o97HpVKARc32+0Mi9Acs1N
	4cDlP+bZ1Z1Yre+7szHZomPIwE6u4szj5VFUB4OJ4Au4hUeDwjEvA6RDV8uZW4RV5lRfzANzT+8
	NzBSBFx+lvlH1E32A2o1Z34k4r3V/vEw2fv8sP501uXWCDtfrdV33jh4rBSxPHwGzE+j8zUzDIL
	eBwvKw=
X-Received: by 2002:a05:600c:c48e:b0:49f:ce78:356a with SMTP id 5b1f17b1804b1-49fdeffdc94mr35490545e9.27.1790169924310;
        Wed, 23 Sep 2026 06:25:24 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm77720025e9.6.2026.09.23.06.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:25:22 -0700 (PDT)
Message-ID: <13686465-879b-4afe-8b33-486fc84d9307@linuxfoundation.org>
Date: Wed, 23 Sep 2026 07:25:09 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: prevent priv from uaf in cmd submit
To: Edward Adam Davis <eadavis@sina.com>,
 syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, shuah@kernel.org,
 syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com,
 suwan.kim027@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <6a8f1920.1d9ded08.62e62.00b7.GAE@google.com>
 <20260827012153.138991-1-eadavis@sina.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260827012153.138991-1-eadavis@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 19:21, Edward Adam Davis wrote:
> The num_urbs is 1, and the request is not special, so it is not tweaked.
> After stub_complete() executes, priv is added to the tx queue.
> stub_tx_loop() immediately dequeues it and frees priv; the subsequent
> loop iteration then checks priv->num_urbs, which ultimately triggers [1].
> 
> Use num_urbs directly to avoid accessing the already-freed priv.
> 
> [1]
> BUG: KASAN: slab-use-after-free in stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
> Read of size 4 at addr ffff888034999db0 by task stub_rx/6028
> Call Trace:
>   stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:609 [inline]
>   stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
>   stub_rx_loop+0x2d3b/0x31c0 drivers/usb/usbip/stub_rx.c:707
> 
> Allocated by task 6028:
>   stub_priv_alloc drivers/usb/usbip/stub_rx.c:314 [inline]
>   stub_recv_cmd_submit drivers/usb/usbip/stub_rx.c:490 [inline]
>   stub_rx_pdu drivers/usb/usbip/stub_rx.c:688 [inline]
>   stub_rx_loop+0x638/0x31c0 drivers/usb/usbip/stub_rx.c:707
> 
> Freed by task 6029:
>   stub_free_priv_and_urb+0x427/0x570 drivers/usb/usbip/stub_main.c:321
>   stub_send_ret_submit+0xecf/0x1810 drivers/usb/usbip/stub_tx.c:333
>   stub_tx_loop+0xe2/0x3e0 drivers/usb/usbip/stub_tx.c:437
> 
> Fixes: ea44d190764b ("usbip: Implement SG support to vhci-hcd and stub driver")
> Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
>   drivers/usb/usbip/stub_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d..85370b3bc600 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -606,7 +606,7 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>   		return;
>   
>   	/* urb is now ready to submit */
> -	for (i = 0; i < priv->num_urbs; i++) {
> +	for (i = 0; i < num_urbs; i++) {
>   		if (!is_tweaked) {
>   			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
>   

This fix is incorrect. if priv is being free'd it has to be handled differently
and not by using num_urbs. priv is accessed in this loop.

thanks,
-- Shuah
