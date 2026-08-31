Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB633E3D93
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176149; cv=pass; b=G9yp+V5jLuvFMZwOLltU8Ryo35Q3qqmXoy7Q0n+Fjev8o5xAQSh4B2HQfkA6CeQJWU5Ro42/9D2s4FcLwS5hNNGA3Ey2VaOYc/KkvHPrK+gZ0xIpYtabvaIwYfjs8DaIkLSDcbiYxMCypFs5SyUSbl4zWkvemSk5PYjstToLVZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176149; c=relaxed/simple;
	bh=iVsFzxcjtXpLLAPWir7xOZsYFnrqAkLPip0NYRBrV0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0++Eszal3Gp8Fl0vOwtkw1BhmThqp9mKf1cc9WLMA4PLLDXLnz/MlMHqkbB58Gjel3V5G9dn33YQWefr2fAqK5ouByQnqifJHyYwy2+FlmKmoDy46m3Fu2Vcbysq7tabUP/89TfnXXc0dXI6oFH4558LhpOpG9v86DofHRsGAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F5P5uRTu; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F5P5uRTu"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so2975093b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 04:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788176147; cv=none;
        d=google.com; s=arc-20260327;
        b=O1w5Tc+PCGGI11YSVotj2S0LKvN2/qcL8nl3vH3nxiBCz9fLc6V2Gv7gHzSesz444r
         Wss+yH5JfuHBPNvd0p7/R3H21RgYi18+ZEZlkq4t57HmjKEezdVgNFmWBHPzcPmBjxBf
         mchPtzjBD87yl5Qs914I7KthHm7MzeCvqUd9a7L1b7pMD+zVxzxmVrXqHON8Teo6vhoI
         lxEUEa2D8XLiq8Cav7TeQHZOv5suf4MVsSVZOEYkpSyfKo6JGDq2ur8r6bmzRBCtFa70
         nvLOdOapbeIkT83R6hdf+miSsQBkHahodEBKOPT5Pg17jXINjeFqsRa5rU862/MZr2zU
         3eVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1+kYYpmqjR7YioulSNP/VCyRhVs3EIdV4wSWvdX0GY=;
        fh=u7blKcrtwGrHvISXjAh8g535OyEDNC7LJI5ej4WVd90=;
        b=B1DQNDB4zsiDM53a2uDTYL54dDBRPRLrISIQlnDVOdRtpDEPtka/yjXDhqq9MP89Ei
         pOz6U6Z/Qo8s4So1xvYW8oa5WNdD+FEMql+wl0vJZXgqZvtNPN7QtXVnOo61dA4tnqZ6
         0QyoCuF+64Fk45p8e6RDZYySDH9i1819to1jn4ehiBenEiTs810fIejPhylGyA7N56Yt
         6CvOL1nrMcQ4D/1H/wscZDsJM0Ei7IdFikuPG1zm3alfaCV1cXsIwz+cBfuATUwZSd6N
         ngjtUKIjXMbIdIXWJjZVLmrbhMUuDPKS/hHzD2eiX8QjBNUWMEjwNmTP8Z0J8uO42xgb
         yraA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788176147; x=1788780947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1+kYYpmqjR7YioulSNP/VCyRhVs3EIdV4wSWvdX0GY=;
        b=F5P5uRTuy6Gr8DiIlS+YqcTbkx0JynRSTtPY/5B9qaEDclVB4axwWdZkjkR5INgKkZ
         7XpD4zJi98JBjHl2Z0Fnb+23h6VLc09Vs30W/hhwmorYvAc9evyznQOlTlywqv9sDKO5
         dQ4KIozJWrZnxq+sOiZh8Ohzl+VVMDqyQNM2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176147; x=1788780947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1+kYYpmqjR7YioulSNP/VCyRhVs3EIdV4wSWvdX0GY=;
        b=nxrn4nhuyCh0gAhK4b4I8iPw8YsVqJl39aQf2Fakh0kLovYtN0qjzWlZ7zTNGF5jmK
         41umZw4RJLxyo986QLqI+F9+RSl10+1sb0hx3Jnn2425lyIlMkqWYJ6ayt0Dazes7/o7
         7teqRKBwKR/Ww3VrkTjUd67XWbN0yXf8qCnQJgf/USQ4ss05fXSu4xlUnXu1paqGQxyT
         KpH+Ffcqpw3AWiL8nCtJtiHU955/GH4AcE3SdeXDxmdNGcf+yp+suuYU+fFev+15oalA
         x+DsyDT6KMXEYHEGk7orD4va3sC4vC3dH6/M3+LuV7tXgIq8Ljp3OL21m6IB7rOzuoEp
         nQ7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro289Nrzic9xFnQ4Yn8VPAUTvx7hIO9n80Ldobwp1SsFKbxnAj32+Z0EnsZ/tJ8mxESXCmfjI3hejE=@vger.kernel.org
X-Gm-Message-State: AFuF++mdVKXiHXLOyaF46K0rUHuMW9l49RcGGAdvVXFnbOwwAussURuX
	bM/lQIIkhMw3PKjOEf+U8uOnsr87jyvXpbiuX5otKAhGD5JpJCbPLTdj3M+dHLBBfYPUF5JnKSJ
	68TRow9ptKdag3wd7WFdeu5lTkP1Jm5pQi4rGn6J0
X-Gm-Gg: AR+sD11D6fLfQ6icVKmcJiqtCTMY5V2WBDIfPeCMWTOjxDuM4GTtivUvfkuxJhhUK8D
	G+tiFwnehwzm2jPvzxaV59Ktdz0TQK63VlYqYBemFfC8E2ZIj0hNqmUUvFJdtOyzYX8TQH4g76r
	ONSGK6w+dHjGUajFgiBUjoMsmgDLak768JVybv+Nq09i9+ErMCe8jrXveuZMFr+MhrXUgPYnXAL
	Sx1J5AqNxXz8nVW5d9fmpH1DW8eAkSjpts9AHN0lHs6+HX+Wu56qVjG/NMOcAH2CTIZl5GFyKDJ
	nEy4ARwJGD/PIMl8wxHIHDF7vVbDW3Ss8vJphB/wIwVkfN72khQ+i70ewjU6iMh4DL7gEsGvNqo
	=
X-Received: by 2002:a05:6a00:9090:b0:853:50f2:9c03 with SMTP id
 d2e1a72fcca58-85b5a546d3amr655244b3a.11.1788176146691; Mon, 31 Aug 2026
 04:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825234545.2076049-1-jthies@google.com> <apVZVCzUEXp1Ahv2@black.igk.intel.com>
In-Reply-To: <apVZVCzUEXp1Ahv2@black.igk.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 31 Aug 2026 13:35:35 +0200
X-Gm-Features: AcwNN1UG8a3e-ri9A1fYCTOuTDVKemg5UPzTBUYjlI4nabQw-8x155-qLxr9oOg
Message-ID: <CAMMMRMdiAF1Kx9CAwZrWCiLGjrzVnoQ_Rm-m-UXSAF+fhS+y2A@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 12:37=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Aug 25, 2026 at 11:45:45PM +0000, Jameson Thies wrote:
> > The UCSI displayport driver indexes the connector's port altmode array
> > with the GET_CURRENT_CAM response after checking it is not 0xff. The
> > port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
> > returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
> > not equal to 0xff, the kernel may crash with an array index OOB error.
> >
> > Update the UCSI displayport driver to verify the current cam is less
> > than UCSI_MAX_ALTMODES before accessing the port altmode array.
> >
> > Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mod=
e")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jameson Thies <jthies@google.com>
> > ---
> >  drivers/usb/typec/ucsi/displayport.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/u=
csi/displayport.c
> > index 7067f2561b84..8d2032d0762c 100644
> > --- a/drivers/usb/typec/ucsi/displayport.c
> > +++ b/drivers/usb/typec/ucsi/displayport.c
> > @@ -74,7 +74,7 @@ static int ucsi_displayport_enter(struct typec_altmod=
e *alt, u32 *vdo)
> >               cur =3D 0xff;
>
> Can you remove the above line while at it?
>
> >       }
> >
> > -     if (cur !=3D 0xff) {
> > +     if (cur < UCSI_MAX_ALTMODES) {
>
> Shouldn't that be the other way around?
>

Looks fine, but shouldn't we return an error if an invalid value is
received, similar to the Thunderbolt implementation?

        if (cur !=3D 0xff) {
                if (cur >=3D UCSI_MAX_ALTMODES ||
dp->con->port_altmode[cur] !=3D alt)
                        ret =3D -EBUSY;
                else
                        ret =3D 0;
                goto err_unlock;

Thanks,
Andrei
