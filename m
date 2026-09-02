Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E0C1E98EF
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319600; cv=none; b=eR+3/NobwmPFgl4TobkQEUc8+4XqUVY59fIfjUOJoUuIt6QEqPz5VZ9tORfM64oKqQNu7Lnm/Eh0x5p5dCvcMvT42nn6rW+TlGvTRMH7hxfENzkmSfKVQQ9Oy/oo6P7zoUc+rXj6WviIIq8oGBFpSZF57yV6veGWGeOf62LtYUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319600; c=relaxed/simple;
	bh=96wvEPiwPZfR78LElYmLqc+vqsPLRsuVXQK+WuAbyd4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuS9zLySxEzq9Bv+C1oYHGLooFVIWrrGXDI+DLfvP8PPDHmNCzqbJk3K6pwi0OEafLw6z47OXjHUE0hmZaqdy9/n5HT5NRJO3lrJq9D397Qtei8RB63A7qAKiKi+zKFXgG8+EzsuzXWN+3L9PmSZkIC0a9YLEnylerCcYjsYhLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zcs3JbQr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zcs3JbQr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5043495e9.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 20:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319596; x=1788924396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWAV+LvRXqnUBhlcQBpGfOksFpIYqg+MNUT0HrN6l6o=;
        b=Zcs3JbQrig9Xlfw2jzMfNoBFox3oNzg7sc2oQjzk8pEJYhEZIBSJYlPEyGxLqxMCul
         o9n+aO5tyh9N6PMudI14ZJ/Ij6PZFbiHi3ZgI/t2bv4qAAAIJAV/IEa+cUfGmXv215hx
         3nZHCSXVc1E4w6K50I76RH0OuBSbymioEB56Bs6liCDlv/OzhMM481qw2xGX2JpoAGQt
         zJxa2r5NZYMpqAmD4r9qv5Z1aSSb1JlPyz36FyCtbU0+OjRoaVHojQL7yxYgWfw/9Qy7
         YAKWyG3V4AQdmB6Ss1Ecz1lhEk8MksKufAZ+ShfZJa7qX0uefaig5NfAsGJ9BHhEkSMN
         SHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319596; x=1788924396;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWAV+LvRXqnUBhlcQBpGfOksFpIYqg+MNUT0HrN6l6o=;
        b=npkB0hTODTYbPfRBRmd8RauxGGL/5jvGNX+ZStVzr5hL/asqYzFh0Ksx492c/FShr5
         DTTh3wNkQv6AmoHqf9tQa8GhGqPI8SX8+N5OWz3S5pjksoxm6HTpNTJyl3p+mlaBtGd7
         plDp9wVB8wkYC4g11hjxaGbiyVqn/zKe4mXg0AsReOtP6j/ZJuMQotrOpPX2GK/KZDJK
         ebv29dUhAbhwYwuwln5g/0UQhQYvVcdpozN9HZOlhjQ5Am2CVtDWD1rUkRNW1zA8J2f0
         xa/5lB9G+3kFzUwLTB0u9+ysjyp1ngAD3Zltxd6zGD3USnuUEd20xcK2V226HyFlRIvG
         JTig==
X-Forwarded-Encrypted: i=1; AKwUvBz0MgJJffrDbPc7o8BTwqzKLow3xyXOvLMWy57A34IhG33i6uJtT3JFBCGERuF7oCCXmXggqjAwM+g=@vger.kernel.org
X-Gm-Message-State: AFuF++k/03rIEcHe40PoHT8qP427UFtTfb6VgwyYgIKk4LUuVKGM+Bb3
	/oSpGUfwKmpfDCCX/Iv54gA6EmSg6BZ/9HQSRMlw/DEx9d4O74CZm9K2
X-Gm-Gg: AYBFou0uynDyMLd0WCLWWo2KWoT/s038Y3zKWOM2gnjk0mPEv4TrZXpYafXq0KaX/9B
	Ch1oNRmG232JfwxJeNVYJlf8rlNsX59e9Cgi6oZtL+RxhHQT1/Dqxpyohl2sda53cksvNU3ExVh
	R1HsetyE8olpsrNsCKXQTIbDcw5IHSZhlflb/C/qGyYVlCtJyH71mCdgAeww9OesPIoDOfMbkvh
	vzghgN4PZSHgGeJoZJwUuDDtafnMj4altbNmge+zuHLyuqkauttXiXyJ10QudBpjbZMsvJE7Z+D
	OgYtDrvbipEIQEvt46wLwqmi5redJwin5+9EkUfkqjekVzxPwUPvVj5J/8yzf7zHzJyEPCv3NFQ
	7e3StbYpVV9qKqe0yjE2Vf9q3XjSSPI7hPmrfpGFXVDSq35NGeQKS3Ww075DL8inkziBrqcoAWW
	27GwjAWh7/hKUxwg7qMMRqKjb7oWKUJ6g2MXj+osv8MQS5IorshgElR51B8w5EQ/DI3cs=
X-Received: by 2002:a05:6000:4a0a:b0:484:39b4:5bc9 with SMTP id ffacd0b85a97d-484914cba9amr2358765f8f.26.1788319595898;
        Tue, 01 Sep 2026 20:26:35 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7f8f9sm3312839f8f.9.2026.09.01.20.26.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 01 Sep 2026 20:26:34 -0700 (PDT)
Date: Wed, 2 Sep 2026 05:26:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Rishabh Jain <rishabh.jain1198@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mario Limonciello <superm1@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4] usb: pci-quirks: always assert xHCI OS ownership
Message-ID: <20260902052631.75c6068b.michal.pecio@gmail.com>
In-Reply-To: <178831224746.44206.8934470315568179153@gmail.com>
References: <20260831211126.23745-1-rishabh.jain1198@gmail.com>
	<178831224746.44206.8934470315568179153@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 01 Sep 2026 18:24:07 -0700, Rishabh Jain wrote:
> The xHCI ownership protocol requires the OS driver to assert the HC OS
> Owned semaphore before using the host controller, then wait for HC BIOS
> Owned to clear if firmware owns it.
> 
> quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
> is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
> while both ownership semaphores remain clear.
> 
> On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
> resume to terminate Controller Restore State with USBSTS 0x401. Linux
> then reset the host controller, both root hubs and the USB Bluetooth
> adapter.
> 
> The controller entered resume ready and halted with USBSTS 0x1.
> Endpoint state, 100 ms save/restore delays, scratchpads, the DCBAA,
> device contexts and command, event and transfer rings were verified not
> to cause the restore error.
> 
> Across four S3 cycles, asserting only HC OS Owned changed USBLEGSUP from
> 0x00000801 to 0x01000801 and eliminated the restore failure. Testing
> included the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel
> using a test module that set the HC OS Owned semaphore. Clearing
> USBLEGCTLSTS was independently verified to be unnecessary.
> 
> Always assert OS Owned for controllers using the standard xHCI handoff,
> and leave the existing TI/Renesas forced handoff unchanged. Keep OS
> Owned asserted after the standard handoff to prevent firmware from
> reclaiming the controller during subsequent suspends.
> 
> Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
> ---
> Thanks for the review.
> 
> By "stock-kernel test", I meant that the register change was tested on
> the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel using a test
> module that set the HC OS Owned semaphore.
> 
> Sorry, I missed the AI assistant guidelines. Fixed now.
> 
> The TI/Renesas forced-handoff path is restored unchanged. This revision
> only changes the standard handoff path. I left the byte-access change
> out of this patch.
> 
> Changes in v4:
> - Preserve the existing TI/Renesas forced-handoff path.
> - Limit the ownership change to the standard handoff path.
> 
>  drivers/usb/host/pci-quirks.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index 0404489c2f6a..fa9b5db4d115 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -1193,22 +1193,25 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
>  			 && pdev->device == 0x0014)) {
>  		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
>  		writel(val, base + ext_cap_offset);
> -	}
> -
> -	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
> -	if (val & XHCI_HC_BIOS_OWNED) {
> -		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
> +	} else {
> +		/*
> +		 * Perform the standard handoff and leave OS ownership set to
> +		 * keep the BIOS at bay during subsequent suspends.
> +		 */
> +		val |= XHCI_HC_OS_OWNED;
> +		writel(val, base + ext_cap_offset);

The change from val|OS_OWNED to val|=OS_OWNED doesn't seem necessary.

>  
>  		/* Wait for 1 second with 10 microsecond polling interval */
>  		timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
> -				0, 1000000, 10);
> +				    0, 1000000, 10);

And this whitespace tweak isn't either.

>  
>  		/* Assume a buggy BIOS and take HC ownership anyway */
>  		if (timeout) {
>  			dev_warn(&pdev->dev,
>  				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
>  				 val);

Note that val is being logged here in case of error. It's probably
better to preserve the original value for this purpose. We *know* that
the code above tried to add OS_OWNED, but we don't know whether it was
set before or not. Not sure if we will ever want to know, but still...

> -			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
> +			writel(val & ~XHCI_HC_BIOS_OWNED,
> +			       base + ext_cap_offset);

OK, I see, this could unintentionally clear OS Owned together with BIOS
Owned. This can be prevented by explicitly oring OS Owned here. And it
would make sense to document this problem in the commit message if you
are trying to solve it in this patch.

Other than that, I think this looks good. Just in caes, pease test the
final version once more to ensure we haven't broken something.

>  		}
>  	}
>  
> -- 
> 2.50.1 (Apple Git-155)
> 
