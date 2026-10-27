Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111749;
	b=uLFS8/xn7Edi03RaPzNydbnE7fW+9k8J/8gkrlkWvfIFcGokzCS30aqrMCnYEevmbxKc
	 L93a9IWvowufQPd4xOgaInB0gBSTbbBGqLR+PdJA3uNEk4I/2NofvUaY8J1hK/qO+QfTB
	 UqHSQISwABr58chtfjPpBdtpY7Np2A893phtyZCwWMpaxUDLqOK9Q3mkJskXCuxlJoN5s
	 tWbfOwppE0B4oeftq/xtVLoob4iuoYdEWhk4N0VRnEkDSVfjJhfeL+kukCrV6GqCmIT4+
	 Isu0GcDgANVyMh97mf2sURZGOyesXYdYVdSuIX2Z9/nMlVMrT8UNT2j0kMxmgBIZsxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YRBPfEuEjxiSl4lXEqZGK3PF4IiOziovuFu2epJkAlk=;
	b=cuDFJO2zXtI84DVHN3D4sdkPlPPvOVTl1LQsFiEJR7F9Z7zL9LVrTRZU6JY6CUGoIt10
	 dWtVnvt2+5ghPKEWd/hae+lLBisU7uOwAuIEg4410CmxGm9CLziGShBNZC/m69jqvrym4
	 8Wg4M1aW4sFv0DR6xo1o8pal+dXz60L2T2mqLwNxyn2bDTQWh2+KFSxRFIp1653yHxXfk
	 vi62kTNrtAnT301RoIct1sDBn1dutNeCSxP4U6Ckas4yacxENkDOa7NTnqDa1vWkVddFT
	 ZXQzpl18cNC1oD0o/iCeqhix0G33XHyY7edW8JY9pTzR5MoWF5JX4RMI5+4lC25pbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MsYbwsmg;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3FC606A330
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3FC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MsYbwsmg
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso4603013a12.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793111737; x=1793716537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRBPfEuEjxiSl4lXEqZGK3PF4IiOziovuFu2epJkAlk=;
        b=MsYbwsmgnWrlRG/PLiwcEoMreSyrMxfs7+Se9WaCZ5dr+QtziecY03C0gAYO6UveLU
         4p4gjKaYahYDet3zYls4IY6BqHbEcWPdztU3/KoE9iGDaOX6Au9xQHswl3m6LEv8RN3j
         KVXTBPvpX4lVgSaL8ODvuLWkA9pLhdsDucc4GAs9wLccH0lw4GmwFZqgaQ58I5fpkIQh
         +swJalxc3bcyIGFIOD9B+8VTLc/GhcfIYxEjiKIMTa07vqb2zS2rIqpDLg8jrv4aYik1
         asabeXOE4D39AiCKtC48hG47cGSjl/xv2/+rHFfg0C0yUvj6kRqrEfXlSfP+HcjzTVwB
         2JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111737; x=1793716537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRBPfEuEjxiSl4lXEqZGK3PF4IiOziovuFu2epJkAlk=;
        b=mNrDA6TZp8qDlTfqeG/1wNSp0W9dvIPX6oSN8iH6dEcWTr7e0U2r2rRZ5MbRwisK+z
         yccuR0WYPCpZPDvQQXrRKJeFG4w96qxDTEW2/JH3UnGaGVRjlC1dGbF5dhQRBRjN2tJ9
         9Ei75zmr6StiCIv1J7A26VTRgB0fIFnFt/SlpBOn+u1O6MkvHN9XaP1OtAZLS8Ou9wWp
         Ui3I0t+44Uj9IVc7j5ZnZ0WK7k/LMS6ZjQUuYf84NNaKGghfI9zMz4hbSrc9ZR1TBVdK
         ZtlOOeLsGMTOalawP/FiN7QlZM4sCDGVwbkvdAG5r3oASJymvdJjijPSQ50TKTVzd7Ki
         iqeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQUPz+zQzJ5hT6b70+V8tvAbYmU3wSbGQvICYOLPp987XdPan7UE2tu1CrNnTxEfw18I6ahm6Rncw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvhP5gAx7oc/cV3qGoZ4SMfRSkQ0bHi9w1G8H7ZRM6RL8Z1X0H
	woZQ0dJFumI08+G9ugmQ3nCZiY2OaZgB1Vus6wUKfb2vkmNwn99UnNgk/RmqkWoidK8=
X-Gm-Gg: AYBFou3P4utARbTANzUh3I4f7mGPkDYbML1r69ZWHKTPv442ySHaNkIIFNiESyJHpfI
	Rs+qGClw/GQwvbN47uF/rCDZi7tedGw8LNz6IQoo4tUMU0HKMuwngPvTbvSV+pdErNZcY0rJZ9N
	/PFgxiTz3UZ1phzze3L+scwrkfDA7C0R2a3VT6wU4sz2eyo1XkCOG/XDhMoOED7U7NLpP6Ai8RK
	98GLmTJ2CTloYStEuEjJUAEkozNKUJmmCH4rOjJ661hkl4W9giqWKOVGw0oCUycH82tKG0r288l
	3ID2B1WL6xIJ99BOLHSeRGVPbPDGT/m6jDARUfBwB0Q8PzPUdQbmVycTbD7xkQOkiIZPphYuShr
	XngKg59OOiXgLlmlcwMCplKCQmso70uXECp+hdF1/rHYvrZLDXE61uAXRs8VDYT+Whe8HFHB53V
	yQJhMW5B2W3+GBvZIkmLBn13yOJ72v3CpTam8TgLD21suMfEyony+rAkSF3mhPLIJuCcn3Qa/Ip
	c+owS3zBnmRExS8cPK7I3ydhPkhHWxp3T6FQEh3r3sR0pQvZm1LNHeXlwD7k10VKIaNOsx+cIFb
	XETLA2zcFBZdYCGqFNlq/qUePT/QVpf9VQ+ATn1DPO4p
X-Received: by 2002:a17:906:d54a:b0:c40:aa04:18d0 with SMTP id a640c23a62f3a-c46bdd971cemr1053838166b.17.1793111736587;
        Tue, 27 Oct 2026 07:35:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a7:df01:6e79:f35a:ab88:b157? ([2001:a61:13a7:df01:6e79:f35a:ab88:b157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm23338023f8f.33.2026.10.27.07.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:35:36 -0700 (PDT)
Message-ID: <8469d5fa-2f4e-4565-8d84-43d6b71b4a9c@suse.com>
Date: Tue, 27 Oct 2026 15:35:34 +0100
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
Subject: Re: [PATCH v3] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261027131458.983241-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261027131458.983241-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27.10.26 14:14, Jiayi Li wrote:
> USB core normally disables interface endpoints before calling
> uas_disconnect(), cancelling URBs while the device may still be
> processing the associated commands. Some storage bridges may then
> fail to recover after a driver rebind and require a disconnect and
> reconnect.

[..]

I regret torturing you again, but there is a simple issue left.

>   static void uas_disconnect(struct usb_interface *intf)
>   {
>   	struct Scsi_Host *shost = usb_get_intfdata(intf);
>   	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
>   	unsigned long flags;
>   
> +	cancel_work(&devinfo->scan_work);

No _sync
> +	spin_lock_irqsave(&shost->host_lock, flags);
> +	scsi_block_requests(shost);
> +	spin_unlock_irqrestore(&shost->host_lock, flags);
> +
> +	uas_pre_disconnect(intf);
> +
>   	spin_lock_irqsave(&devinfo->lock, flags);
>   	devinfo->resetting = 1;
>   	spin_unlock_irqrestore(&devinfo->lock, flags);
>   
> +	scsi_unblock_requests(shost);
> +
>   	cancel_work_sync(&devinfo->work);

With _sync

I'd say both ought to use cancel_work_sync()

	Regards
		Oliver

