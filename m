Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF6281525
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129844; cv=pass; b=jAraBh1SyC6/i3TzuHjx7I0oS4LRWSD/NHg0hQsOsYw5O0E2lVr+VcQThF+WRLKiWgLMIQ/VbL0wb+DmE1sZkXT7wJEzQZKR2l+YdACkGDBZnBW0ZCLJFC929x+NtWgnh0uMpg9Rehq9wB2uijuu85chaynwJa5DqR5WdDp8/E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129844; c=relaxed/simple;
	bh=v4wQmEuXJ3AgJxqSJJNCrhWWpsRqBhpP94Uj5WKhkto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4xPi5XKX01OlMctadvU/SqON4vX6DroBWRG8etuUxCPD7ucQRmpAUhUtOImWQ+e8uTgcQRVFsBXf9PrYXVTN25kfTLPL+ODLGj6mTvwwlpexyk58ze0qrEx46IVfL6hbSD3lHKs0n2mXyv28Woq9muXEWKyqWZb/NBNZcnDLSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XYiDsXfe; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XYiDsXfe"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf3781ca51so39623405ad.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 05:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782129842; cv=none;
        d=google.com; s=arc-20240605;
        b=Xm1qqaceyXZ1Q9MoXCKitivJS8uiN/pe7MP/fNQ4zXy6Lm1zjpObny2+9Bc97f/VEh
         0D/VdRHWKSJtNMyPHybT34lCohUey8o7IR6pzj0xv8ExaOigoSVmV8Kj87cAuvFFhUiJ
         40TsdEUOLERwQX8DzSeOXEK19DWI48bxVuzAqPNJ7+t4co9lZDyEuTfTN6FyiolS2Mmq
         roait5KFDAdFWqww3+p4ED7ZRLLEnWcO0MRrXcuCwPm9+OxXNzz3fm2N810GmzlSXLII
         +7X+fdFiwgXWJemObuOs2z3S3Au4A4d6IVDarIKI0b0k316cug7WI+ztds3X+7jjbQrX
         4hIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdEvVDqlxLktfZRd74ICNuFXfvM45QtfNrKYv9GUHt0=;
        fh=70lcK7BA1KohVv5Py+Hv5dDpfgjFnjeM2mzcCA7+3j8=;
        b=ZRTj7XWSUYrSI6krl3ZP9YlimMJwdALBfVoYz3+K7yWNq3wHrbw04/6m7EDEOiGJKg
         olrUsClTVzGebR5NuoZS/j/JgJyYAtygWoEGUBNnzj1cvvf1UMZ8fs7oRRUsadiYbn1D
         nKsnkT7lr8qjlIp/Gcory5DY4IaE2sRAU4tGy5jS9d+3jk97/cODFbiGMq8rps06a1lJ
         SV6Ws8tnIDKUBaExwT34/Cc8KD8FPHcQzQpiUujdNCCzI7IHeWBHB5NlpVGvqV0mr3oC
         4/nsO3rSR4Z9h0XSItBXb5JpZh+7JMbYDhpEkhZo/zMaGLeADk0nLMARMyLjb+82kxyS
         5K7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782129842; x=1782734642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdEvVDqlxLktfZRd74ICNuFXfvM45QtfNrKYv9GUHt0=;
        b=XYiDsXfemSASky5SoSYDSV0G+RSDcaF2OdQP3hE0s3bXKr3lsebc3ELsN9v0PAphqw
         xrwj/+580Bvzs/xfP05d4ifz3LBdDyE8DrOvNd5GiermEVb31AcaIntPDpq9ck4xMeHN
         e8O0HFv3hywNg29Sf9DSts2YmbfMqURhOVes4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782129842; x=1782734642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdEvVDqlxLktfZRd74ICNuFXfvM45QtfNrKYv9GUHt0=;
        b=XHlLepShqyvESq7XZ3FlJRXiKJlG94SkbNj+GK3a0HIekx1LR6aESVSzdlMjx3PqAB
         F+dlLloAg6BG4JHdvdM4P9badT1UdXQAvHqLLqSqODnwvDXOpbenYEUDMjXq10xDedE/
         RylA9TlBUESLUpuHpYGwU+pRrJ49Sq9tjys757oGz9IbfJrBhr8yaDYqdqaWrYeaNK3x
         ABfdlxV7V0mOT7HBTVx/JkBlywhTS8tCWYhbCAW/XPwHYLRxcfgeWpdKdtamro0MuYPa
         ktIkUOKJwRaQCD4dEAkgpoCot+cXYjnZr24v3OZlDKec9IaeRagLwWN2UnESlh5ILsnb
         aIAg==
X-Forwarded-Encrypted: i=1; AHgh+Rr83ZbrM5zJCcIQaOdcVJorCI9bxO1VP5bnq9KG0eHsaeQCYDL2S8wD03nO5OOVHpEbY61gwTk67VI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5NQ6+uwWiQyHufNPnKMEtP4Vw9akpnLiJNdpU8m4h8gmx1jxr
	g2bk+XyLw7Z2WSdg7QLI53HZxxNFNVvXZ9lfWhHhp7wwi12GSZ+/dC8yq7tsFy3YgmPFYAaZm7n
	u36GhmDk2aqwAZ1ILZA+TIspgixgxXFiKbBf3/QMd
X-Gm-Gg: AfdE7cldMxjyE/OGUkN0mR1+z39uxxCiKx63MM+LHCYuY3ixtR3/U427pseCkTNuU/0
	T8ALgIMaFS8rfaDeFsPemyFBe1G1tFH5VhYR8kmRhqMJKkFnIiZNGaxbTqDrUueqBisOonFkGXa
	lPk2cq9Gk+ZbzH6MaUkpvV+dsRQwcn79F4G4mxskYw5qB0WcgAytqh81KWpjwIJpuZvKp98VFPk
	nqAk3iH/TvQO5TC8kHWQ/CLi47H0eiixkrhQcqUlOXZ71vOjIR1OHDW0/gtbbgZRr4+GS4=
X-Received: by 2002:a17:902:ecc6:b0:2c7:a735:705f with SMTP id
 d9443c01a7336-2c7a735722bmr27067715ad.3.1782129842002; Mon, 22 Jun 2026
 05:04:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622093910.1210089-1-akuchynski@chromium.org>
 <20260622093910.1210089-2-akuchynski@chromium.org> <ajkMCz52lkq9hz3s@kuha>
In-Reply-To: <ajkMCz52lkq9hz3s@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 22 Jun 2026 14:03:48 +0200
X-Gm-Features: AVVi8CdrQ03tlTFJOK2r1IY7DPCDCIQ9vK_zqsvtGUpOzusz2atjGuV_q_6BwJs
Message-ID: <CAMMMRMf0kLTJeVztQwDsz8Zm4wBXX52agNpvnKttkFqupQX=4w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: Add helper to check cable altmode support
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Mon, Jun 22, 2026 at 12:18=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> > +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> > +{
> > +     return unsupported;
>
> So if typec_cable_get() doesn't return a cable, this function will now
> always return false - i.e. the cable is supported? Is that intentional?
>

Yes, this is intentional.
The UCSI GET_CABLE_PROPERTY command is optional. typec_register_cable()
function can also be called without the desc->identity field.
Failing to provide cable information shouldn't be a reason to reject the
alternate mode.
Also, the cable can be registered after the partner's altmodes. We
encounter this scenario with the cros_ec_typec driver. I'm planning to fix
it, but for now, this approach will preserve the previous behavior.

Therefore, the idea is to reject the altmode only if we know the cable
doesn't support it. That's why the function is called "unsupported".
It returns true if a limitation is detected. Otherwise, the function
returns false.

> This would probable be much more clear if you checked the cable only
> ones, right after you take the handle.
>
>         cable =3D typec_cable_get(typec_altmode2port(alt));
>         if (!cable)
>                 return true; /* or false? */
>         ...
>         /* Now unconditionally */
>         typec_cable_put(cable);
>

Ok, I'll redo it. Thanks

> I think this would be even more clear if the function was called
> typec_cable_altmode_supported() and you would then have a wrapper:
>
> static inline bool typec_cable_altmode_unsupported(struct typec_altmode *=
alt)
> {
>         return !typec_cable_altmode_supported(alt);
> }
>

I prefer exporting the 'unsupported' helper to altmode drivers. While its
naming is slightly less intuitive, it accurately reflects the logic.
What do you think about it?

Thanks,
Andrei
