Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70E207A20
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318988; cv=pass; b=e/nAoZpZewHavThbGAdX5+7mJWYm0YD1g0lFg3W8iwwCFcT3f28DjmTej7M78kEvx3I7VqJKd1tGRy/thGm8chS3HHQiC4kYasBshYAd8RthvIhkTBdQ0V8SaTKYcY98St5R0cLGsq9l3XnPvwGNWMr2nQLOFiex1ZWz31fjNHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318988; c=relaxed/simple;
	bh=fuyvlwPt0XTcmclhQS2Affk7gZrA0/CGf7Y+BAmXAYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgQfZrz+SyI6th9A0b+e4tv+f1T8RuGD4wOToZ96s7PIg5Rwj84XuN4cZY2+q0EEyZmi6l/DClfE+XvqUmw10UPcWf5lHn9xY9ZzuKrd2v6IHzfp81O/0JSORo/09+/n3Q5Z5M4DzQAngLyTfB8QtNMsb9E4OhqoWDAh0gOgrWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GBNK4t5E; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GBNK4t5E"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-497e6956acfso1694670b6e.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 13:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784318986; cv=none;
        d=google.com; s=arc-20260327;
        b=fs7gSegBzCPd9k3PWkcoEy8bmS7O1kJIlfEWNlZ17iUU6DU+jyungqiOfpIYeYsKR6
         dl+ZF420xaV24mB29H9HAcReARy800aRH+h1Cf+KoUHVCHbVFSTL3nVG2Hgbe6yBYPlc
         Ld/kRLcP5oCfFltCfcQYZ49+wHWyjqNicegDvo55EIXAM++mKFt5XlkWVYcsP8uBD0EP
         OS7frrtffuOdZB8W2CKaw/ArITQEqN2s1OcoBy4VRYkjlLnYalndLQZ0jNJixT8QH0nR
         +cdFevE8Wuw4MkTZ0Xc4DF7si7LOLxY7/H3VLvQPkqGW4gzgmqba53peNyhc9IWshOYY
         t8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/oGsTQzPIVzUquhOd7LVAa8iiu8gSxf6tbKnkANbwA=;
        fh=7un95RKD2bJbulfPEiJ9mBxElfs41gX5Ftg2SVt9jGs=;
        b=s2tazTXBpWLpzkdaiVLc17OPxFQokCsbDLk7NoiqM5DbQIzp3YgQo8mYOaRoO3NSPQ
         PyobOawA5R9vlyINZ9l/k9+Tcj9HvavIZNO6Vo1EghY7mI9t5QfBMuEFsUx5Qcps0Pmd
         0p0HJXkGUI2dSyYDs5+dQUgXANaKjH7sIVeG5A2T1N/eRjrMN0VndP7Ga6AHTPZMRe6Z
         I0edps3fb1hFUNLuNsiYXMijmGdTJwMcU4PmdHASZSJdOVHX9qfTjzL4I1dcnrRoKLlL
         U+04ZsGLb3lJVttiP4ZhZI11W1kJvsYXcHHVErQdOgxJMQLYTfQMGvr+UxLhud06DD23
         KcRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784318986; x=1784923786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a/oGsTQzPIVzUquhOd7LVAa8iiu8gSxf6tbKnkANbwA=;
        b=GBNK4t5EJg+Q7MBRIthnH3DvFWCNZkU7xOCb17RBAfkf7mvvLMMcc5kV2fx8gH7ECK
         +Io4k82JVFk/vqhwsTR/tWUtgfdcqiDcdrgW8wWO3K3c1Q/FMXqFmaIOWv5afl9Iv47T
         EzOmXZi0zCRFL9QUA9bos7P3vadMYbWvDAyHXzeEqHUDsuG/hC9n0KQIEeN7UvxIMia0
         FquvHpHVieLwql0sJFkpYnPmYblRrAxQFnI1KUC27GTv871SW8DCWxITErk+TNoBReyA
         H7LIe75zx5mwUypzNhPCdRDKG2BNFhUBfZMNGxep2FLGeKLrtX4G2O4pApkxrVWYsA6p
         5m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318986; x=1784923786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/oGsTQzPIVzUquhOd7LVAa8iiu8gSxf6tbKnkANbwA=;
        b=Hni/LINXn44klH03u/MRbosQF5DO2ElFXG5lx3uJ3SjY+HUEpJWWDQcRJiFlxPdA1Y
         ygFS0S4b6axPgiNa5H7pIthsZDnK0qLyW5OL0VsAYuQvuN32bREQaMpEbciioZ8WzSd/
         7QG9oTQXaP6sYB+L1PjXZG5FvIA39t1826Di5S1Xsiso2XJ31g5cQ69MjygOBY/lJXGT
         1YlwdbHelAKdaf6XjzV4FTgDJbIDsn9QLcWz0OM6LUx3Kw0Bb1pbRRhsBYRr5HSdbDCL
         +E0IIbz4YcoRgLq+QOJ/H8hYACUvoI3gXY4rtLk9ujETdvS0J8pcKt3yRhjeANrGw1Gv
         Rzjg==
X-Forwarded-Encrypted: i=1; AHgh+RpCgMoJKwGPA668riwtTKdG1pUeM29v/4vFkA5Xbaqk2/H2q/Qs00bF2QXM/kEV5EoBsD52wfCqKLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Yx633jIrbY/qfy77f1Oq3KPUSdjZUqzg9ai8abJY8IqK+THw
	OqRTxlckAUFEvitGteAhc/i8lmYtJja7ZgVRv9Z9pvj1CcyrcOYsCUQ5uxYsKppjtaE1JNu4AF4
	ijwppHhfMRSDaOCuUs2miUavsnJAk1S+l1Hx+DQhv
X-Gm-Gg: AfdE7cna0798qQkv/xwbmJy9xI4t7qFD26Udk04D+jIZ4y8zI4pKoyxLPBDwrHk+sFR
	Pzqa6qR3KYKWJAYK7urye+DZkkKliX+s+kUK81ewKQkTQBiKX754I8AgbCGd6I0mznjImvykh71
	jca5TEMRuMvFqv6DyCWEuAIKDt5ACh6kRrB1ETG9XXjXSzCbtQXZNRJPTPIaozrslXMlpcTdowC
	3eV5XMG0KmGVakVl5FIpnbRXR0QPvjYg8AjHm72vaDbRNxz6t5+Z69ULURwBIx2BjStJHGpH9Ed
	0QAMpreeLGkJili6MdlhNbAFlfAa2TQ=
X-Received: by 2002:a05:6808:3007:b0:486:caa4:ea44 with SMTP id
 5614622812f47-4a4b20680c0mr5042366b6e.6.1784318985031; Fri, 17 Jul 2026
 13:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710200308.1401321-2-rdbabiera@google.com> <alYJHaXFR7q0q_Xq@kuha>
In-Reply-To: <alYJHaXFR7q0q_Xq@kuha>
From: RD Babiera <rdbabiera@google.com>
Date: Fri, 17 Jul 2026 13:09:33 -0700
X-Gm-Features: AUfX_myEj5B4NTI3ixuAXDmW795frjjR4YKKXMcANtLiE0szhvu4UnHPPoUOKgw
Message-ID: <CALzBnUHXDozZbPFB9tE6MPEbSMcmHxtkFpU9DMcR2b7M3npJVA@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 3:02=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> This looks good to me but let's wait for Badhri. If you do v5, there
> is one nitpick below. Otherwise:
>
> I think you could trim the above a little with this (is 0 a valid
> version?):
>
>         if (svdm_version >=3D 0)
>                 tcpm_queue_vdm(port, msg[0], &msg[1], 0, tx_sop_type);
>
> >  unlock:
> >       mutex_unlock(&port->lock);
> >  }

0 is a valid version, it equates to SVDM_VER_1_0.
I'll add the nit to v5, thanks for taking a look!

Best,
RD
