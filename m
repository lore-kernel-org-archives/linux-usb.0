Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E917F4D2EE0
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070963; cv=none; b=BRB5meOsJa4aFqoeJkySrRTDk24v9yeQcQ/HHuTP31QdTDiezoRt9PJeHd7vdQrMCcaUyHBqPZ69rV18wzcTRiV4SMz9wZpR+LBu2oP196irf8gPqGqx2D8bmnoiHzEgyycM+rVuVLWb1jWpHA0q+m0eyyV6KjTOqso3AX5rlBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070963; c=relaxed/simple;
	bh=vhtBOq46+vxnVMew6tqDj9pw32mqh2c/pNpj9HCWF5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haYVzvlZ3BXdZ6bMFVyWm68l9btliC8kuxplQCju5eqUBj1mVUZ0CMHvlOwqIuLB9kGuu7HOQEmK/IgJn2TaB3P4JT7Lr6rpYD9+mv6RDi4Ji2vbPxduo6yCkreebWUhABuNOTHmHzz0xdBK7XaqQzCM2KyAZmiCriEajMDSzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EzWbXEjH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EzWbXEjH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso3166185f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790070960; x=1790675760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GovoQhgpkFSxI/w16iH1Xm3iicrwAlkN1B9IHqCNx44=;
        b=EzWbXEjHED8CPODT/5NP46rKxo3ggWN1EUNgzvlub7kzfVKirtjRRlbe/+XsWzenLY
         N8v5PATcnHpDVALjG6OOeq2AZe5paIevguOKYuAcLvMRdRw0ZXCMcrceyyZEdSMZ+Nfp
         6T7vm2QroUq9NAzaB2H6jFLMzbctmRjL0+Un8KoGvjCsdLX5tPnNHIon3Y5JFe9xIlpj
         negzdjpA2SKvJpu0PN3aQs1PHecSLCSQ8ScRjEfLmhvmBBydXBHMa/btyxFui6DZK+30
         ox0TD0n6i5giJ1gZhEqG7tSeMu40XqafDQ3H1WZ7z7E76DI5g/eqwHADY6LrRceSXcTi
         ndgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070960; x=1790675760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GovoQhgpkFSxI/w16iH1Xm3iicrwAlkN1B9IHqCNx44=;
        b=Z2SBv58h/3p5iXw8GpbKKXDzCc823NPe1iYErrgflX8Rl4RYo9/4yh/v7z8lJaJ8hm
         uxVQDpzGdfk6yrSFlJo0O+hTuEQnv0+qdYwBLEvngwBfwitR9DDo9bHMsiXaOtz79qC6
         qf5du2izfy+SuoSasa3F6bxtuYXHUmG3CczNsROTVXvXOYw3a8pJy7zl2iqr+jQwGwRp
         gj0rilbKtrT3HhxwBHrBl+ARZTAVJJXOz6iuynqmlngrAGdCRZMNlxitSzNjU2cTqkB9
         +F7GwIvpLQxIsVkZDZcZFD/QV4xFmtiImWsbo2hJtK0rOAUz8eTlXr4GHbqpL4tejlaG
         UjFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4NQk48S9Wz8C/uTnrwbrFr2adPPWjANPT1+H+VLxUGYdxrASQtYWQEAYX1o+gFohMVb/JkzEPkkE=@vger.kernel.org
X-Gm-Message-State: AFuF++lNai9qn6J2Azy5zWeDjUAaPRKOuWOtsSJsneDwcLxte4tZ9SQV
	mgM8SbrsdyeIDlrxzrHn9657DKP52aFh9c/2r7VGVNeQ1VZNep8udG2MooNMFEbo0uc=
X-Gm-Gg: AYBFou1LGo/qsavDvXQAwW+0ttxvI9wbp63OH8JF0qBPnAsus16y5GdrFOjs41YVA2S
	7Dhgd8iS9DnQc832yn4iEMezUxXGnLI0RL3CUBWlW7zuyiAfxzy9PNZWW+p9qa98jZfyPIejf79
	5Bkg6aBEW9lQJTa89vjib8ibJAO3HSzCCviQK/awhr3k/91x4yuLcozCChaqFRz3xpX4J/iGqw4
	ikf9SfNFljJeUgEjZDWR2KZg0xXoVFe+8IHDYKBCqfYtCcyijyB6VpqXZhRCr5Y6p83NL6jwOeu
	v63bkEo/9QU5tSVJkDR0kHn9oZzSZUi442wUrVKKCcy3CAGVCvcjkGsDsBioDN8b2vr6hPHqbbH
	1jZJdKAiIk3MdHyqky68/CMjC8UMKw7Qwd92Qr39YU8ta5ghZgLPsKYep4ZORNA0Nej4HlcSKQ4
	FgE6YQ9FMAYuDRs0QF/P2X2wVnSGDSjPoLhnWiAiIJh1hF/eir4SM8izYNG9apSSH042oxZbFE9
	UTt/LGjiQLHYIh2K80HxnTI/URkpkhMzikjmNBi
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr209696075e9.31.1790070960066;
        Tue, 22 Sep 2026 02:56:00 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f0:9e01:9a7c:db93:afba:8f7f? ([2001:a61:13f0:9e01:9a7c:db93:afba:8f7f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa4e47csm78584305e9.1.2026.09.22.02.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:55:59 -0700 (PDT)
Message-ID: <38d2639a-d5a3-4d01-ab86-8aa7e2fe75a7@suse.com>
Date: Tue, 22 Sep 2026 11:55:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: btusb: restore powered-off Intel
 adapters
To: Sean Rhodes <sean@starlabs.systems>, linux-bluetooth@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 Xu Yang <xu.yang_2@nxp.com>, Kees Cook <kees@kernel.org>,
 linux-usb@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Menzel <pmenzel@molgen.mpg.de>
References: <cover.1789679980.git.sean@starlabs.systems>
 <479fdb2638f34ccb02f35a40a34fcdc7cc41ccdf.1789679981.git.sean@starlabs.systems>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <479fdb2638f34ccb02f35a40a34fcdc7cc41ccdf.1789679981.git.sean@starlabs.systems>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.26 23:19, Sean Rhodes wrote:

Hi,

> Tested on a Star Labs Lite Mk IV with Intel 8087:0aaa. Three Bluetooth
> off/on cycles reached ACPI D3cold, restored the same hci0 without a USB
> disconnect, and discovery found nearby devices after resume.

Have you tested this with a different device and S4?

> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>   drivers/bluetooth/btusb_main.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 

[..]
>   #ifdef CONFIG_DEV_COREDUMP
>   static void btusb_coredump(struct device *dev)
>   {
> @@ -5093,6 +5125,7 @@ static struct usb_driver btusb_driver = {
>   	.disconnect	= btusb_disconnect,
>   	.suspend	= pm_ptr(btusb_suspend),
>   	.resume		= pm_ptr(btusb_resume),
> +	.reset_resume	= pm_ptr(btusb_reset_resume),

What happens to a connection if a lot of data has been lost?

	Regards
		Oliver



