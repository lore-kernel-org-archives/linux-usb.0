Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1951A724C
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 04:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780183; cv=pass; b=Egd7wgu7Hbt6+O2M0JgkKbmxVMRU3d9TkdqxqV/oHdSYR2DBwVqPS3mWYtFaBv6wFVkG4NcI10EOczUjhFVujV1CkmKHEe0YePeYVcfDb/77ilyfAGyOcfh2eU5kfORno59MgFEo7yPOZmcy4IqTUVWsmAjlRhsfnXKAJ3VHZ3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780183; c=relaxed/simple;
	bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUpB042vUHSu2LOKOgS7Q3dWP5t/1Ea67Lt7ofI/JoGZwN0M/8xkPZIjAqLeNzhVd7f6mWdrctFzs8fkY/zN+Tph2dNceJ8lpooqLGyEaNHDTpqJs5a3yI2RCciPPl+d5FpuaUfPWsknRdpthpZ9jvpPi0RLpMZMaILa9wgYuHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lRrwWi7F; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lRrwWi7F"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5337c7b9937so239511cf.0
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 21:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791780181; cv=none;
        d=google.com; s=arc-20260327;
        b=br20dU1LIdtuKqlFg4fDXq6j1pfX9zGu8EL03oP7Kk3W87XyBKRpWfp2hD89emaoHI
         jpZNaJ9jxgIKO5YwAhh7a6u8LTArNaH/VeGwF8wwFhx0TNGsKNeIOsSmDNbuMjSB8hIs
         30OvswgcKchIwGLffhyVvDJGZjI08ATR12/HertJ6o7NMebz34dCjrEinIlffPm8IOrG
         YkiitdT+izq5iOtAAcwi1uBeZWHnLJdY/pySh1RvHxgOKoca4IH0WNtAEpmoZUDPbYE/
         bcEj/0V40w8VCiKz/pRLAuKbqow5UM/YafuCSvGRxc3rRv9MgRHV+8IKGyYPUxkYLdX7
         u7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
        fh=4RvfP8dNPa+hk0oGQlHaAQhtqWZ4HLFfKq6tpV/PW2U=;
        b=AnWxcbdsAxMkGX13oqEsYrjwJLhrhs7vnXuafQ4SKsICThEf8Uxm6E7bz15ME2CLLB
         qda73tZQyF661Rzexaf2eAw8Lqo0XRohKnx17CjWAIgryKUiD0Xma1vjWEfel/VQUqb+
         rvs7YvZR2oTBOVBtC145xjg+MiPGE5ug7bXP5vkYHtIM4L18NF7mwMx+xm0NgOpbThlM
         rh2GPYvGwt+udr6Jtbs53yww2wAfZ/jKfSrMbWZK0Rg3f0ecwUPufxteqoCPiZD/wtgm
         1R5R3WPyP9pMl7H4pVFl5RXnwQNofafE5WeKB7NBTE4wUV1UqP1o7e4exf8RjsKwG5j+
         wEhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791780181; x=1792384981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
        b=lRrwWi7FcFUPHlfDXo5k7ZZ7zaKBuPGdktkUPvK2xQT1blRNakIK98soxv+hzvAjal
         mz+htGRZD2NIdcy6tBBo5ck7iDn+Vrw4YyXtFOfEb89sJKPNmpHWgRJBTHZoT8oUw1D1
         XQfmBrTl5N/5Jzmq3XsjQREf77vlJGoN6OZeiJFryOsFJ22py2ofsuoZpQCwoJ/VdSYm
         qsdG3dn4gKuRDAZdetFgcNnu6+R4lIAW9JZ6bHab8zYmg7DYSJvLQzfaYQXPaqlHUBNg
         Z5BK5sJJyVSyqmVmS7+QoAcxvup0m1LFnRj/7PrmnJ5lFyDiRkM9EV69wLURAJlrIVkv
         x7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780181; x=1792384981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7ZOGiXP/y0XuuVq0GGeW4XlrYot3iLolJO+gBxOVkc=;
        b=iEwyeqHzX5vm7VHB4S/TyXMr/gV1IDRZCMUcGDLQjJaEKd1l84OIR1/tc1Fn1uiYrY
         GQhJiCldqnqYixXoCedjUY0o7PvYJOlZYQ09HMupI2iadZ/BZ4Ekqa2edcT1J8mWpHcN
         2ObWavmWXW/FPO81C2f56EOsRDXhC5mw4AD88YbenA75vSxj4q5scnvrCWHTMMzMvcGA
         OI5diBrrRGpYJNETz7vJs9Lz06ULlZqTAq8MufV6xi8XTzjBIXMMQN02C9W92VLT6/xO
         x118nt8Tge18mEitwwWPuSuIqPcGrS8Z5uDAXM0rnmPHsaL3O5U/UyfoFEoWgoTA8Rmy
         23Cg==
X-Forwarded-Encrypted: i=1; AKwUvByTaYAxy3nqr3uYmEw7ELUyQzeb2IWzTHjI+IR4Ikvom+EvRZdbcwBKpap81QyKgFqEfz6jGio5OFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHelFGjNfoJYvgDV+rHGy/k+F6PfndhQYMEYEbKOu8HUqt8sc1
	8qDYpixCjIGhc0/bvshokza7c5DmKp4jfe4T9LUnJhdQUn7KcnvzM3rAFqJl5Lifgl7PoDD/SLp
	2Bc6DzbcNnZdiJrGhJDIHdI6FkAzyY+zOWnIWf5eJUDRLRoG2Ei8H3AAP2SI=
X-Gm-Gg: AYBFou1ozJm1ekLzgSuJi3usToE4YQqGv+ppGn2DeaAZExQLNG4T0RC1V/eXWG4IOrc
	eoIC1T+iHxu23xUZgyD8YaFmk74u6xerUk+/6aEasZTLZjd5E3MypldxB66bv4grGJ0mGP3nP6u
	oqaO3S2raNgBZAUY/5aA//eBtoumZbn9JVsyEgU8OPTRuopCrpAG8rRB2A1lx7pCbD2dzQxjTre
	Rzw3trSmVT+LH+NeBF7OLyZVlsfP1SqHWvPd+c9EfWSyupy0jI7xaaCNeIcjcHY+Wxux05Ti7OS
	Y7KhYpN/9yOjTex48jIWrtTPngyvcXMwtcBrLOdBYpjGgweW1Eq0uQqn0YNLeFZxlwoe8TMpNOT
	KFcYjEiiSmw==
X-Received: by 2002:ac8:5a0f:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-535b2d9b1e9mr21987221cf.1.1791780180731; Sun, 11 Oct 2026
 21:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@google.com> <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
In-Reply-To: <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 12 Oct 2026 12:42:34 +0800
X-Gm-Features: AclHuK9p36YBKHu5O0EITzYbC1tM5lufGULED7e72-TUQxSBC9jxELhTwbNAaGM
Message-ID: <CAKzKK0rNQ2sM8unChj7Ya76ogNoPCNQNx1X8vu1Dkg2FwRfv4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Fix NULL pointer deref in debug logging
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Faqiang Zhu <faqiang.zhu@nxp.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 3:59=E2=80=AFPM Kuen-Han Tsai <khtsai@google.com> w=
rote:
>
> Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> Closes: https://lore.kernel.org/all/89e19e6e-7ee7-4bb0-abd6-60971b7fd601@=
gmail.com/
> Fixes: ec35c1969650 ("usb: gadget: f_ncm: Fix net_device lifecycle with d=
evice_move")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>

Hi Greg,

I missed adding Suggested-by for Ivaylo, who already mentioned
switching to netdev_dbg() in the original report thread:

Suggested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

Could you add this when applying, or would you prefer a v2?

Regards,
Kuen-Han
