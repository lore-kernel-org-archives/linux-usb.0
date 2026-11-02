Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793618715;
	b=2HCB0P6UGxSx5KTQCLKX0MfkAz6u2FLGC7KQSZSw/DgLfIJ08PaSFmV0P5TzNf45nh3p
	 bktQXmOTE27VrWdpTjz1qRPJdA7eGMkdaytqIWhv3WEi+GPnKhHRIyWLf/o4oA6mrzU/y
	 JJCri9ULuH9Dav5JEs5tS4fJjLjzsaeOfj0mIKqj0u3sd9TGjUReSKJnpdIE0caJFkj1c
	 2waHOLlcQKl0rqbI46ouSz+08xYzmYFjH2SZyyg0EKx2tED3Xf0SNzhxQqm7vfSq3PGmL
	 HFvTgMf1/JhKBnO+lVF+QAjFScxTCy7X283aScANp20F1YdlyHiUQZ3AUoDoKdxE7Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
	b=Z8VkJYSejeRqhw0rVnomgcAXOyggq9Wv5pHeB/+dqFHtqlW3Rom8xa3G3isjp868N8gY
	 A+JkWdPXZXi1ae3YeOgaxvXJLfzV1OwGMoGpCX26BYar9WBXYNKD4TzITOZYdU8J4bLSB
	 8I5dUsXzC95W9p9plWxqr4Py/vkrBYg1r/9lHAysizCowp+Ja7yU/sjVuIwC6efZMkPy3
	 YO0LBP60dfReMmUe3cm5dh5qF696Yc2SrytijneZNdly/MjTF80ECsxTmaDODSeKoubrV
	 yZ0iUvLwln69JV4CVEM5z1oL3EkskJXLAwDjGCzeEuzO32/FWGj8iS9q4a3Cz9vthdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ4OYDRK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA2E606A891
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 11:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA2E606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AJ4OYDRK
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso849419b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 03:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793618715; cv=none;
        d=google.com; s=arc-20260327;
        b=iC0Wj+C1qUKnQS4CGuaWp/N++pnPpuVqPSv0Y+Yx8cFglOfq1uFZXH+Pm3/tGBfE+L
         ilFRrWxU6mtWB8TVDEiiKIlUVB8+vnm8HZgxQExHYn/twQeUSXOc3k42KQPVLUH33iFM
         ZPKK5yLzv+J7YiqKqCcy0MCQBB5Etv34EWPVKo2X3QYR6DdWox3z6wJFhYaQFxiGwrCH
         LA6XwRdR4khUAY3u7i3wd5MOxRlioTzdfoemZvs1HqfKM3JC6JdunyJ3A7TT+FFavWFx
         D/o5c5CiSvpOCRUAP35jdVlbQ4H+ENlkxjHmuaqn9E39eXHhaHU0Xcc8w984P167tBFK
         EcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
        fh=5uF8IbUuKPFPOAz0U1YZq2IB+bNGLVkYGZdbFjszyw4=;
        b=cT7u5Ptppd7O2IRE6W0v+W3Jr3pbBB90/ITu85DWgrB0PMW5non2bWw6VP6puET9Sf
         Rb9LhWtOW5S+eLm8aK+cIuTVlWul42WvoQreMnOuNuQd6EVWo+xCpmBuHBGGoTrdsib3
         dORmv1zw9p9a5ARsS/qpTZbQUwX8dljDCcMe3gIkdLldYqkUIzhPTLE3VlVySUheVOwM
         HYLQVA8tK7fRjplfFH5tYH/JkgGUBMgz0azmLwpsMwVOQrKLPWfCsSQoTyM8PO3FRm+a
         AmtCB+eZJIj88s6uVt9+9CZPDjdZggwD2RHwuBQY68Wx+bvke62ysDEPHJ6hhXKw8urk
         9kgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793618715; x=1794223515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
        b=AJ4OYDRKDvkCT7+JOoNpal4CPEtb9/AuwEoENrfuIdAtjKwWHbMVP8yeJBY7JQWjl5
         2l4JhCysnhrNCmd4TYsLHSylemR1XKawXTQ5d6nAr3rICAzifFl4shH4Dd2rec8WS0Et
         gcuy8Qmv5ufdj5iaiQJdzyBGtuZCJlUW4Ob+kLTUYa/ctHAtId1J7Yq/809eBkAPa4yX
         clDV34TTIsQTkkY/F12pWrE2PFXriiH4IhaCMCsCkNPCzGBzoWJ0GVCgkk1ojhjlXR4B
         CzZis0fx5rz44f14kpR4LjOQdkoG7/lX0wD4ttLMI3uDBenC2/AW6jCIVo30ITw1R7mI
         dhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618715; x=1794223515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUMha13mPNBOHq6FS6lq86bkIYOWnWQxqSrJsZzXQ54=;
        b=gtElzVsOBccjmnZWRWMY6xqi26Ic4D/9iDUdphzc4vxqd+wOu1KlqbcabsKUJSWajK
         vgygMdGfS6oC8HBVc9Los7J6dxI0AlxQlBBKuy9CR9RRLMDECfzct0D0woNtle/DU69q
         WQcySEu9Eh3sbEd4MkFvx9ZXW6tchIXPClNBGe59bHXj7ZMVVBBUOPY2Z1QuY6lHo63H
         qv54WI1WIJRXECVFXO3Frg88bRllsRJ5xa1ND6DgJG6iHMF5YUXey2J8n6rg6NQButA6
         8IsKXOXFC10TaIzyPyhkYcH7vWYNfZ7fJk5ol5D1Ee0QgtxE39aECOcajvZmYaISPFU2
         cPvw==
X-Forwarded-Encrypted: i=1; AKwUvBwOEcwVND0UbkuiBBLtitG3NdZqlvXZ+pY6+ZmBXHpI92+F1rz+UtDJqYINCFffEn0jxF7Q4N7OVX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX6sXMRfcmVSaia8inBwPLouL63a+b3K7zWSUFIRN+hIhSNT1M
	2tX4N7KepJUiXEb15nXfpvzUV7N6gPaLzsOYmE/cK8VrEG5ws+FGdr6Dh6cNYyonJiSlVZ9sWJi
	YUEPvO1lmXOPfBsjyQXiLg5y6QniHJT0=
X-Gm-Gg: AYBFou1L0bp/eHNwhjoySGzi+0zU5+DLuGTu26MYcK/EU3HhtpGPmmGclxTTCiMRn/Q
	p/XT3D6eWJS3vzLb/1HJgjwP8LmLqKBasweCza3b9ULbrEE0KIFCJDc7UxQrhMiSeg1Sm3Lkrm0
	xnysqO4LNC5lrtblYqkn21r54bK0naCyyUVBpXDu9W3bDhA/DmDFc9meL4etxjASCJjwk/clqT9
	9mbbrj4a7sQ9cqWIQ7um2UGfsiFR+Ht/v/g8q9QPdVi/s4gLtm6+WBfgp7ZBUHakMZJNNsIDOu6
	8pZ6CpOq5B199xbLeRsi7hq9KmMDUYFoOCQQGdFQbn74ACtcvfVYdSw8Dq/8clnp6O0ErfNxF7o
	vkl7GNVsIOzJP/rqPKJvup85Ux93hW9tSwpRayYHxyj4XuXhpSRGkUeY7p4A=
X-Received: by 2002:a05:6a21:328c:b0:3e2:a1aa:aaa1 with SMTP id
 adf61e73a8af0-3e928e4772amr10672702637.67.1793618714804; Mon, 02 Nov 2026
 03:25:14 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028041859.1061836-1-frankljpliu@gmail.com> <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
In-Reply-To: <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
From: frank jpliu <frankljpliu@gmail.com>
Date: Mon, 2 Nov 2026 19:25:03 +0800
X-Gm-Features: AclHuK_BaiAC4s-_lcmqtjA1zMXAmPr5EknWzatz6dJBuiCpCR1hPyP_i5SNHkk
Message-ID: <CALqwsrDodCeJACdTTkP+fWm_DY4NxVA+DtOVeBSjNBbW2j3dnw@mail.gmail.com>
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a busy-loop
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, shashank.mahadasyam@sony.com, 
	johan@kernel.org, hadess@hadess.net, frankjpliu@tencent.com, 
	guanyulin@google.com, gary@garyguo.net, rafael.j.wysocki@intel.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:23=E2=80=AFAM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Wed, Oct 28, 2026 at 12:18:59PM +0800, Jianping Liu wrote:
> > From: Jianping Liu <frankjpliu@tencent.com>
> >
> > hub_probe() sets the hub autosuspend delay to 0. An idle hub is
> > therefore suspended at once, with no waiting time.
> >
> > Suspending the root hub can fail. While a port reports over-current
> > or a connect change, xHCI refuses the bus suspend and returns -EBUSY.
> > usb_runtime_suspend() returns that error. The hub is resumed, and when
> > its status URB completes the same suspend runs again.
>
> Why should root hubs be special?  An ordinary hub doesn't refuse to
> suspend because of an over-current or connect change.  xhci-hcd ought to
> behave the same way.
>
> > The PM core would normally leave a gap before that next attempt. It
> > starts the autosuspend timer only when the delay is still in the
> > future. A delay of 0 is already due, so no timer is started and there
> > is nothing to wait for. Suspend and resume repeat immediately, and one
> > CPU core stays at 100% until the port is no longer stuck.
> >
> > If a root-hub runtime suspend fails while the delay is still 0, set
> > the delay to 1000 ms so the next attempt waits. If a later runtime
> > suspend succeeds and the delay is not 0, put it back to 0.
>
> The concerns raised by Sashiko are valid.  If people really want hubs
> (or just root hubs) to have a positive autosuspend delay, it should be
> set to a small value such as 100 ms.  Not constantly alternating between
> 0 and 1000.
>
> Furthermore, this can be controlled from userspace by writing to the
> aprpopriate sysfs attribute file.  The kernel doesn't need to be
> involved.

Makes sense, thanks for the explanation. I'll drop this patch and
won't pursue it further.
Thanks for your time and the review.

Best regards,
Frank
