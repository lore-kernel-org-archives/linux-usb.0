Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299337;
	b=PmVs2flA3eTDnJ605I8MMJDQPJd6oTa1KUFweSaZ2EQj2Btisr0m3xmGqm3dHB700MoT
	 5M81pg1P2f55nHg5qjYmz12HiJvZDRkMfn4T0xlrHajp6ZiuNRrRv00PjmWzyMU4XLiuN
	 KOwDazOnM1s6LwGXo9IHVSQTKKgTsnBXcBDWF2lPfvKZLv3HEbfGSvCkcYm2Ac4QfnM7J
	 qqg2GaqZOo9d8r2emKIT6ybq+EULS0WA/QJLi/b7/ivWuRC1HXS9txLmQU2JNHHV0w/zO
	 ognCgy0OQ/xXwnuvkyIKYA7z4jP3IEeGYwkwZ5be+ofxJasLCaTx2UtbEMXGOwL6Z4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yyKfQb1ExiAMJfqfgRyzEb4vXsSpl0LrfEIT/OP5q7s=;
	b=5kksM0vDvPw74A0NIKZ/CXLOMNX4F4deUPvG1P9+5uECQW8254hHSn6kIte9Rq+fASD+
	 uG3itCZAbiW4UIJt3t06eENFf5SP5Bdrw/SLkvb779IMyhahefTuLPLSNoa7jjtbKS3n9
	 RSAjfnbDyL9xUx/5OgtG/rQznHd38qEzAOcnT427r+3T46UOs3Jp3qcqsVqkIiVvk+Heq
	 mNGl6NjQWY/D4/ydo00pkhiiCFKwPyyoTe5eT8zipHCI+/3cDzDTQmb0u02gJiMr8pqgw
	 QBiBtHO7hr4/NsCTgOTr44CniQEbL3AHfiPgAGAUj6HVoWTBX82DEql/E/7lFUQ/lZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=H0eMWThJ;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216C606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 18:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4216C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=H0eMWThJ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8256106635eso2150a34.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793299334; x=1793904134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyKfQb1ExiAMJfqfgRyzEb4vXsSpl0LrfEIT/OP5q7s=;
        b=H0eMWThJs2MN1qHRZ6n07NBaKzzvrxDguMoSm5+Hfn96u+SGM1HpfnfaA62Qd01lqT
         tINCl0H0LgBWREnDZBTpiCZTaXcPGr2XkkiMjQs2sVflGQU/C4rrN9D75Hgmj+PrXUNf
         KHH+Lg8+BZPxcVZbw/8VVA7yLS72ryQdpugfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299334; x=1793904134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyKfQb1ExiAMJfqfgRyzEb4vXsSpl0LrfEIT/OP5q7s=;
        b=v0H3afVgfbZY37RqbpK1XdRvlmdBRWKLFB+rBA0uGDtBXgw9Zn1S2ftOVlj0bSBx32
         KETOZpKTdfUziF7d5YspZ45XyOrDfRFmJZAVY2wxoWDp1hUSfAWLKY+zPBF1suzO8pqX
         H31MJ+PZtaGZQ2t7rMwDVsCGFEbM97FxYjwSMiAiMLOSbY/YopIVpM7cK9F3c8hBxGxW
         yKSELJQA4sASZFUF1P4QtHTYHYvNUIIR4JRheOIfhNhPq16kx+ygSK6n+GQb4fTM3dzX
         M7Iwk4KVE4/Xx+5Vh5sMuTWsTAyfhdIJwsIRxAiylhhtsbWs8+Wxjb094dkrqLc9+SM1
         7VOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ9VNnX93NjhB4dvf51St6FdxqcoCR4UhhWtQ6/NiZce6a7NJX5v5pLPrXm/vry7J0bKDteLXq+5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW5EyX3wrvMC/003Nu5zoxuqjji35QR1gelWOZWd3gFsd4dm5G
	Ac4jQLYD/cS6XukTz/fOmF34qXFIJw8VK4MS/2wyqwkeI+sVPB5LpJXSjTzpuldw7XI=
X-Gm-Gg: AYBFou15Bn79BIwY1K14m6913lRak7zGfIrfWx1kgcw0uq9JMu6xXIxpJZbIg+PK/2f
	KLhkcYL16Xv57Go7wQyuhsTb+lTZb0z74w4NXhymiADDD1eJ1v0iqydQFXxYByJr+7Mot0eyETS
	6msaAthqz8F6egdwsr7Uvzz6WDWBJVZRYel1chpUNIaW7Ud9FKhvrbzphfl2qK60VtGY3NWTGuF
	1p3i7gTf2b7M31tsL/3sHPYlAPtOjzbJYbY4HBXajceUz9LdGflXf1iGDTsBUv887G5Z8DofaXY
	lU8Jy72+Sbz+N6ypnfNaCBlt2SnLMPIR7RstyDycXFlOxfUdKO5ufXYbh5oeiuUWu1oKlt8/WIb
	eoG+nZ1HKjTxrVgueGKTd+6FEh+8qV8xxhK495FCGt0a6myiATR7OOdKxuNvysXxrso0wgTRIvb
	sYmaB81Wls9+v8/SaagmCMJCbMXSbbBjJZfK+2wRFX6Ccw5DWSYP+nKTaGk1DWiQ91GeZB4jH4K
	Ig0FhZr8AoFiTTQ0TV4A2hlAxkCOWVOir1vyqKozmTFDSiJj6TcIo1xYNT/fw+9l4Ucbbayegrw
	FKQ4uRcp+Mkd2DwR/mvtEga2qLhve2V1dy3Gjb4=
X-Received: by 2002:a05:6830:2308:b0:81b:864b:7f02 with SMTP id 46e09a7af769-85d362992d1mr53321a34.2.1793299334045;
        Thu, 29 Oct 2026 11:42:14 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545bfebsm218042a34.4.2026.10.29.11.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:42:12 -0700 (PDT)
Message-ID: <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
Date: Thu, 29 Oct 2026 12:42:09 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
To: Cheng Yongkang <teel4res@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <179328314074.648427.388274461758949120@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 08:12, Cheng Yongkang wrote:
> vhci_recv_ret_submit() receives the transfer buffer for an IN URB.  When
> usbip_recv_xbuff() fails, it sets urb->status to -EPROTO and gives the URB
> back, but leaves urb->actual_length at the value supplied by the usbip
> peer.  A malicious peer can set actual_length larger than
> transfer_buffer_length; usbfs then copies that many bytes from the
> kmalloc(transfer_buffer_length) buffer to userspace:
> 
>    BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
>    Read of size 88 at addr ...
>    copy_urb_data_to_user+0x36f/0x480
> 
> Clear actual_length on the failure path so the failed URB never carries a
> peer-controlled length.  The URB is completed with -EPROTO and userspace
> observes a zero-length, failed transfer.
> 
> Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>   drivers/usb/usbip/vhci_rx.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c..741107a 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
>   		urb->status = -EPROTO;
> +		urb->actual_length = 0;
>   		goto error;
>   	}
>   

What happens without this code change? The code path follows the
error leg because of EPROTO? So how does setting actual_length to
zero help?

thanks,
-- Shuah

