Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0B4156CC
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171115; cv=pass; b=LgE6k9XM2F6DJA7pK5t3xxROmO15u6fOuNLMKbX3vqLuhhGKUsU6p8fA75Gg26vjBVu9O/91vzjNQNacY0G91oAcphWi03hz6uLAOOKBCG4+sTVnjx9zzxiLBPVIfV2i2XbX8Uv5r/t15iJpUzyqwosugwFqT6emrWyiDp/Z85U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171115; c=relaxed/simple;
	bh=l9hEapXFjhD3ebiCQnR0Mo/cNkCwktpHytvBsARA7mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9SjQ1deh06oC092jx9KY4DO0D66eKNLREY5jxIc103tFyMQJo3rXDUUGppjSqbl0Vqe82B5JNZ9hwe9MvmvWGDRkYANFAn1smY7DKTfev46EamsFOqvSJuX9XVe7FeEidw/aff1iy4s9K9eT1NfAwrjZckScygTTkFrNRhRTsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lqo12ST2; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lqo12ST2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so4268365a12.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 09:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785171109; cv=none;
        d=google.com; s=arc-20260327;
        b=Nv1JYWoAlXN4nSqD1KopXxg8CG8y4myAOdsr+Axhe/5woNlEutJd/wWYgtbE7WQB0q
         2USS9brK8+L0XWzAAmDicYmm//la7DHO/Nh99Bv6hSU2ZwgKMu4/X94fMT9FnBsWTIQi
         Vt4/92aNnJvShcSZ/bm05g4glcxZcHxYCahZvp6O9mbLXmvrGdVOxjveCO11xpcyw+xX
         VZGJQ1H+ycuhoB7y2eMEpN1s6IEWLIwpxaNkgEc/+t9XAH6DOoFOQVVXQx3LSYSNc1gH
         qZKQcmvEIuEr+lXklYUEMRy7s5raG91yGA5zaaH7G6BcC7Nw6aSl6qTyVXAxTzf2rUGv
         RGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l9hEapXFjhD3ebiCQnR0Mo/cNkCwktpHytvBsARA7mU=;
        fh=rc4OhCJwTDPyR+1fwkHLNEXz4ZlkCHJCHKTPXoIBvBk=;
        b=p6bGa/dMcMhfsyWu+luzEFkadJtDWc9a5pHj322sCdersUCEiFBeEQczQYP4itiXvT
         9USIGchm7xR+6FrYO5nLysxuCefvWux4NCESz+vndqBDeEvA91dVhB8oV/Xb7EXmqKY5
         oBMe9e2h6O6ra6q3fyt/YOLG0SuVgIc1xbmlSGxPxPlNHOQ7C1Eshmhyf9Ej2QvUVLjp
         XDdF48i/7FNiR6WdXL1jnBnLLaqHvW67yzuirzlryyZOUuK6p4DoqTLjkG5d7LsJSuEz
         R1RRFqRZsOtVhRX4/FqPIhz7LCS4cOe6SUesD+B0xVHC6glb8eHH59kTQmSaUz0//zbD
         k1MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785171109; x=1785775909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9hEapXFjhD3ebiCQnR0Mo/cNkCwktpHytvBsARA7mU=;
        b=Lqo12ST2NzU3DhyqgUCrRkhwLf2CclHdnSrrj9RoS5TgBJ/Z0eV4ETXAA0Wzff3MaK
         xuc0uPckgDYaLl1kLiDVAtjmUfVuCosKjDwrak0wyQogmAfFVDomfFB5/UF6KgyFCgUW
         W5vVfnX5HUnSVyq/vZuuJrLj7Bg5MFJmCetL8+p9yFkRRqIQ5/3VGf51SXo6k36vcEf1
         C5MwIud7/9J8o1bHKk+kwjLd8cXuIct+B1NW6e7uDQRmANpvH0INg637Xd3zsL+cirls
         7j4QWMYq74Bey+KMlOuxwOM2Xmj46GEAV9stOFIU47pVdc4tABHt+eAoTX8OMvUnp0Gr
         gSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785171109; x=1785775909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l9hEapXFjhD3ebiCQnR0Mo/cNkCwktpHytvBsARA7mU=;
        b=GQ1zNxd9k4c2bA+4iYjJDPCN86f2/6Fcflx9ovXVimlaaKoektnrD5j1+YLBu0wiT3
         4AHTmzl+ERBzjee3gSj+5T/bp8hBS9caazhwKFvKPFf183ihQVApNWuB+ePWss2J5drj
         zsX0ETWlPc6lVvSpVkQ9lcYdFoeENRJBlxxFDZ+sVZBW0ODc1+LvszPVjHvArZh8jKp4
         bu1Blaca/xEtJeUrPv1cZmSrUVpLwUNEBTK0y4XdVtyUhNNroIqI6CxLo7mWahhyJ0E6
         O1/3FqGUDLQn3Bn7SYJ4jzWQJm69f1HtyXIGQApDahNa5j0N5neA7rYaKEF1JSb3WSZo
         ELLg==
X-Forwarded-Encrypted: i=1; AHgh+Rpicn8dcVPc8jCh8skt8GU7LBgPk83ZYst9K7yy8YN97D5ZpQ0IdnOPJSgAZb8crQn9AMUjPwstwdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69pgVQt2W3A17Y0ZgCDGEQhK0Q+tEX1pA/jmmahDhKGzRE/ER
	WxU01e39pO3XSsbZCb3SXN3sN62ZlHf+sTVG/WhSYqeesbp5MCoUM0/E6XJDZg29mpVY0D5ENC4
	KwcUdZQtd9E9C0kfcoBreNBIcbAFvh2uEF/24tyE=
X-Gm-Gg: AR+sD137EuJ/LPW6ynsIpkkqUfp33ZwGnKf4EUxIa82Q6YzJznOcdlEBjAer5+0mpGT
	YsG8X/q1Z7dVCLurzUTW7Ywx9TuaLYgd92IZBfqXEEyUxNu5ZTvNDquiIuWvZfxDjXLaKn7Fw8J
	Doaw9a+WLJwF++e3dfvevqo3nuMx4Lgewylmg/PjNFx8sZq8StJaiBDrxmAD4njls10WiqFpp8a
	r966/rQJtyELB5cjRUArHn0/9wnXnBwvj9k2nVf4U1zRfF+qJULR0zmf12WK9tLXvZpMNK3lezo
	J5kH4eUlmmwctyd/9/GwBRy80f1SaGIsNLgMNv+66cpA
X-Received: by 2002:a17:907:7ba7:b0:c15:ef0a:adb4 with SMTP id
 a640c23a62f3a-c1f1f1a7396mr379839266b.61.1785171108625; Mon, 27 Jul 2026
 09:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721202201.27442-1-mtormento80@gmail.com> <amDplMXaf1JpxE0v@kuha>
 <CACF_UwoqtaGMB=O2em92JcTnW1RP_ozD415ieAbMBgmmq+gG6w@mail.gmail.com> <amc9R83pQ8-XyYYm@black.igk.intel.com>
In-Reply-To: <amc9R83pQ8-XyYYm@black.igk.intel.com>
From: Marco Tormento <mtormento80@gmail.com>
Date: Mon, 27 Jul 2026 18:51:36 +0200
X-Gm-Features: AUfX_mwbgCbY83swB099b4e_1HXHRBXUFCuTwRfmNvFUuzBpK6V1H5gouh0bOSU
Message-ID: <CACF_Uwo-hj8qpWoK8EjYVKRui2EmwHmWZ-ntS2Yd8MrTZ5Udgw@mail.gmail.com>
Subject: Re: [PATCH] usb: core: deattach child device from typec connector on
 port unbind
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

On Mon, 27 Jul 2026 at 13:13, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> We should not need to reverse anything. We can't avoid calling
> typec_attach() separately from connector_bind() because we can't
> prevent USB devices from being enumerated before the typec drivers are
> loaded for example during bootup. But that does not mean we need to
> call typec_deattach() in connector_unbind().
>
> After the USB device is "attached" to the typec connector, the
> connector device should be pinned down for as long as the USB device
> exists, but that is not happening. So what both you guys are doing, is
> working around a problem with the reference count.
>
> I can see that most of your commit message is written by some LLM, and
> the parts that you've added don't usually belong to the commit
> message. That makes me a bit concerned about how much you actually
> understand what the code that you are modifying does.
>
> Use of LLMs is fine, but you still have understand the code that you
> modify.

First of all, thank you for the explanation.

The commit message definitely sounded over confident, my understanding
of the issue is summed up here in my first patch submission a year
ago: https://lore.kernel.org/all/20250720210847.30998-1-mtormento80@gmail.com/

As I said back then, my experience on kernel code was nearly zero, and
I was well aware there might be better ways to fix the issue: that's
also true today.

What I did a few days ago was to ask AI to analyse my first patch and
see if it could find a better mitigation.
It came up with this patch, I read the explanation and it made sense
for my level of understanding of the matter (which is arguably low,
unfortunately).
I checked the code and tested for a while with success, so I submitted
a new patch and here we are.

Do you have any suspects yet on where the underlying issue might be?

Regards,
Marco
