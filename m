Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987869;
	b=eeAUlw5QhJWyEJvg5JMDqxZP1ngbFIlD+TLu3A0zyU6feJ5kFU/jR7/7Xa5QAJBlciTW
	 xWSYO4JHYYQluU/PzrWrH8NrITru6QuJaguRjUzmM6ZD2j0gB6jAk/ntCDz64/Ct9flMv
	 9juuPJhS4dXvoSk8dfAMYC1iDo/w4ug3jHUKDhxlrzuF0mIKNDLkqPcyMkjfrM+AX1N91
	 qMpk7a3VNzM0QK2LfcKwY7aIXRKlattUaQLL1v+5xy1M2XTkrXzgxHO1GCVv7HGlcj04C
	 agoTF5eeKISwS9qB19domdpU5m34dbflu2EiPklumLxS6+X9X6NogSGcRqhTlGitd0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987869;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Inrsvx3wNYy2gwyot4kKfC79J4xMQXSJOaAwV6hp3/4=;
	b=E1qmbPJmY9RHzNcHD+LL2rLBD3QGJEz6mF8cgFNzIkQruNhizHlAu6shvyh0I/mL/22i
	 AQB0hT0VibQHiMdx4cXsCNRa+kYIgniurWqppN2cjMudOhyG+HWRvzXfgnnpXSkW7jkEL
	 GjMtCQ7kdEbZoVvWY6y9qmG66iIQLzxk/OB3DKMsksyeTjsqIHuk/MXQtnPi0B8MhAIo3
	 IbW3xKNJTJYjPR0qKFEGo6e88X88lQm/8f6hF2cfZa89UrOvc1oxo73t5X+2fSqTLjRWJ
	 FqkxteEBiTz7Cz6x5Iuev2GUkjvGMGjFuOEG8IAC1EY9TqhP6+1pqlA0e89jBiXMezQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YO0TvACn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C4D606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YO0TvACn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A731F0089F;
	Fri,  6 Nov 2026 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987868;
	bh=Inrsvx3wNYy2gwyot4kKfC79J4xMQXSJOaAwV6hp3/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YO0TvACn5D2cHhVUfZe8MK5rEsaeZZAsK8ENuJjKwpZgKYSokE34oxS/Z+stalIqU
	 MbCa6ddVu0RWjJnbDx7iCPEegtI0lq0px+/NpZvS/sUTPcwjdwJkHHBnQeNZYFUvFv
	 tv6cn8ycHcZFGe8MCHYdc0YyxNcdtfocydFCkkY2HN50CNyyO6B3xTS+2qLQrYtKrH
	 mPiV8QibnqtbILrN507xWwAuDAQCZ4js/86J1t+8UVMJ1q0Sxl8P1XM3S818NeRO+5
	 LDc9V2borOJnMXX0zVfFhterONRnkaI3hiOAwkWZCUUGc02Pdb6gK5SkLwawqp2sJs
	 det7OGi09gDDw==
Message-ID: <sashiko-outbox-201980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] usb: dwc2: fix a possible interrupt storm in hcd
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-dwc2-low-power-fixes-stm32-v3-2-68d2a0e9bab6@foss.st.com>
References: <20261106-dwc2-low-power-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com>
 <20261106-dwc2-low-power-fixes-stm32-v3-2-68d2a0e9bab6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:57:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: dwc2: unlocked dwc2_hcd_reinit() call in
  _dwc2_hcd_resume()
--

commit 57723fb6e396e93ffaf40174f532484ee2100bb5
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix a possible interrupt storm in hcd resume

This commit moves set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags) before
dwc2_hcd_reinit() in _dwc2_hcd_resume() so that host interrupts enabled
during reinitialization are not rejected as unhandled.

> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index d5275cd658d4c..28cde15e0cca4 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -4469,14 +4469,14 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>  		 */
>  		dwc2_core_init(hsotg, false);
>  		dwc2_enable_global_interrupts(hsotg);
> -		dwc2_hcd_reinit(hsotg);
> -		spin_lock_irqsave(&hsotg->lock, flags);
> =20
>  		/*
>  		 * Set HW accessible bit before powering on the controller
>  		 * since an interrupt may rise.
>  		 */
>  		set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> +		dwc2_hcd_reinit(hsotg);
> +		spin_lock_irqsave(&hsotg->lock, flags);
>  		break;

[Severity: Medium]
Should spin_lock_irqsave(&hsotg->lock, flags) be acquired before setting
HCD_FLAG_HW_ACCESSIBLE and calling dwc2_hcd_reinit(hsotg)?

dwc2_hcd_reinit() requires interrupts disabled and hsotg->lock held, as
its only other caller _dwc2_hcd_start() does:

drivers/usb/dwc2/hcd.c:dwc2_hcd_reinit() {
/*
 * Initializes dynamic portions of the DWC_otg HCD state
 *
 * Must be called with interrupt disabled and spinlock held
 */
static void dwc2_hcd_reinit(struct dwc2_hsotg *hsotg)
}

With HCD_FLAG_HW_ACCESSIBLE now set before dwc2_hcd_reinit(hsotg) while
interrupts are enabled and hsotg->lock is unlocked, a host interrupt can
enter usb_hcd_irq() -> _dwc2_hcd_irq() -> dwc2_handle_hcd_intr() (or a
concurrent caller can take hsotg->lock) while dwc2_hcd_reinit() is
modifying hsotg->flags.d32, hsotg->free_hc_list, channel states, and host
registers:

_dwc2_hcd_resume()
  dwc2_enable_global_interrupts(hsotg)
  set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)
  dwc2_hcd_reinit(hsotg)
    list_del_init(&chan->hc_list_entry)
    <hardirq>
      usb_hcd_irq()
        _dwc2_hcd_irq()
          dwc2_handle_hcd_intr()  <-- races on hsotg state and lists
  spin_lock_irqsave(&hsotg->lock, flags)

Neither set_bit() nor dwc2_hcd_reinit() sleeps, so acquiring hsotg->lock
before enabling global interrupts, setting HCD_FLAG_HW_ACCESSIBLE, and
calling dwc2_hcd_reinit() would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dwc2-low-p=
ower-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com?part=3D2
