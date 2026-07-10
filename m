Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38994343F8
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694854; cv=pass; b=mymJKIh+EaLY35SpTJgoHht36iZ38ztpb6aQjJ1Vv48E+272+VE6Xv7bT2EDxRUz3szHa+vRymfsJj5LlsY6njEzxRzXmMmoYfmNBgwn4R/JThFd0E414niXIx00bJQp0lBEkRB8hxWd2ZyWhm/zFDKL0j91skvMRng4QGtMLq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694854; c=relaxed/simple;
	bh=zabicP6eVPWDN2T8J0PZJhWGVA3hOxGzJLXt4l6oEKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fx+MF+bOpL7QI0STrEqLH5r17zZeloe7pCwOhlu5LRQgh7ttXe6T8s3HgWto/+3E8B9w2HbVxQs1Wf3II1cC44WjmMHkZzGY/+cjkBpqDjCF0TWYkmLP9P07WyRdQlSLlqtw9yMlli0sQ14bE+hhal+opJi+fIiKXIuO8bZyuXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xb5fs/v+; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xb5fs/v+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c160d8760e0so7075666b.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 07:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783694851; cv=none;
        d=google.com; s=arc-20260327;
        b=fzbhZ5b80ldZ6eYg1Oq6uGzB4kVbwZKdiCF42A7ZTsOuFDyUefopN0WF5EiISCQVmd
         II2MRE9C5tqwvoKJyqEAiBEDZYEziM5LhVPiEDH1juWgIKZbCi5wKEm/axgovioKaXIX
         Yw7iWn90p4ESr9cEJ5wYqxbcOi3PZuGnUzCuH0jY6qVp4sdg4HqcYBJKJX5tjMWfq3Cj
         JRwZQrnMgNopu78tdO5NapzM02ZNkv+A565uqUCuMJUJ12iGYbmT4PuJzr1qqWhtCKBK
         IB7n8u+zpgySDbomWuqPOMumHYVAZyDRZ8s58AgEEVaSvruKAe9/GTgMRjRqnlj9gddi
         +hcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zabicP6eVPWDN2T8J0PZJhWGVA3hOxGzJLXt4l6oEKQ=;
        fh=MuAJJVQ3ratrip6Zegq5Hko0jUk0MbbA8Xv9Y3k+1Jw=;
        b=r4DsmoE5AQW5kLhDuP/Rx+Hxb96xuYUN8Ir6hRXdKzA2z3H9i/cik/77VvQpGUgIgw
         vkZnZ7CKcZw/aR7Vjfr8cCzpWSBWT413zAS44zqJ+DZIJFZOjfHbXCo7lE9+4jbus9fa
         yi/N6eRC7hkjbUUsQX8ziZ7l2NdgHGjzr/tLmwNBFWQYxMGZQsFppVCx5CLJHgn0dqAj
         HJ26OrbtgOJ1Kj0fYZhFF83LaUrTIlST9nmEZ031cictHfRKiFRkpMo2PywKqzMcQeHM
         YCc1CkTI74oeMYJ6WGRJHlODUtI3sNqv735SgDn9km0Z57EsnJY4xrJ+ZcNzTkXGUSD4
         b1PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694851; x=1784299651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zabicP6eVPWDN2T8J0PZJhWGVA3hOxGzJLXt4l6oEKQ=;
        b=Xb5fs/v+LApQCv229iNmSS30ydUoXQWeRPMZon+cXfQFsJvtJv+gKgx4F69Fx+tQoS
         Yi8YwVY5tvKlU9d2U54LQUXqUSBYXECscMLXV6HWDr/lpep63D/FIxjjEV137JjPqBjk
         j5boNUgPlm1pUvW0Yr8+u7mBdyGhi3Xfd1mH/NFDngLHbclgNS4uDymKKeELqyuk30iP
         sUsnILdUSvk0D8QeEBwFU+u8PeIYxDaPyplspNhlJSOQJiDoM7ODZ3GB1FngJfiMjTNC
         79UJbdvadUYsPRVeEPJskXPH9D/4ps4ZBB+45JzU9Oaxio/KYmnn4eWvoocyRy2lHq6e
         CV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694851; x=1784299651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zabicP6eVPWDN2T8J0PZJhWGVA3hOxGzJLXt4l6oEKQ=;
        b=L8KoEQBjDt8mHX6Pra1/+IxUIMDXzSnBGkDXWIgsOxyqU2YAxoLdE/IQSn3mSoQMse
         LFm6j/05Fqna4RlSwbqMW5q/gE1pCwEMRS9wNLF8xvPvfdRd63YbzqXGW6TrAH0h2e2+
         VT0L9Ndh55VxrQJXuhsloko0XyAw+05uljCeMc4pu/HWgtPoltd1UXU/2YG1YyVFP7vx
         fS4vGISNzWPHmS/wu7Gw6YQkpbuIQcsSifxCRDTaKzB1zuzSKkYLgeS16qqt3DMGE2JJ
         /9jF+7JdEUExxt7yUi9Y/wJwp2ZAFGgjKiJUSUCYoxg+Nk3hGADpuKYf7WbnDlr5LHq7
         HdGg==
X-Gm-Message-State: AOJu0YyEYvfhjQz8HLHBA6IsYVtBHU6fnIpdpO2I+FX8SInLpLrlACVf
	lwmQsmv/e7y4OCpR7mSCNRCf7oqP/mKNoCDi0BH7z/AbM2lCrVRGOT/JDUAf8Ot5Wi1ySloeUPq
	KW3OkTIt6sViBKn/gTKATjWVx5LrrIA==
X-Gm-Gg: AfdE7cmeXU3tICvdLf2xqJRILbCieZ+q5zmbINSmu9XESqQRaZKpyCFlvT79a7hvvQL
	UJ2UiYYy3w36p9lblrA+C8+8lbNiMuG9bQXYe+zyG5/3Az1PbStRWWYYX32ugXphxdpj+FANXX4
	5gC+nn9xR8p96ZDHNmHgiDRsbImO9/1Mf7xOBc5HgI3swmso7IDjOByFr0iBGHGBsnXxdlUfOg3
	X8RD1zvRwPPLITlnisoXcFlb7x1GBvPD+28lLDLqn3yMVnl2s34goCChmkoqIHjmv4JPvhSt/E1
	4CSmcnk=
X-Received: by 2002:a17:906:e16:b0:c15:f656:d582 with SMTP id
 a640c23a62f3a-c15f656df3cmr87044166b.6.1783694850659; Fri, 10 Jul 2026
 07:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>
 <2026071024-zit-pretender-1bb8@gregkh> <CADvEaBKxsMx2nATKsuNB7fovPewfiuY-dqiwXtmohLNpZ_pWgA@mail.gmail.com>
In-Reply-To: <CADvEaBKxsMx2nATKsuNB7fovPewfiuY-dqiwXtmohLNpZ_pWgA@mail.gmail.com>
From: Trabajos Iafast <trabajosiafast@gmail.com>
Date: Fri, 10 Jul 2026 09:47:18 -0500
X-Gm-Features: AVVi8CekQLCn55nT2xNIJTuk-CXt8N67iDUs1kjK03LzZ2SL51EGT9eGAsvAlbw
Message-ID: <CADvEaBLNF6fuD83mneDp+fSVLzGya8yrrudRhgZKRU+YCky3Vw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_UCSI=3A_no_connector_change_events_for_connector_2?=
	=?UTF-8?Q?_on_Lenovo_Legion_Pro_7_16IAX10H_=28Arrow_Lake=2DHX=29_=E2=80=94_port_fu?=
	=?UTF-8?Q?nctional_in_Windows?=
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested with mainline 7.1.3 (Ubuntu mainline PPA build,
7.1.3-070103-generic). The behavior is identical to 6.17: -
port1-partner is enumerated at boot, but number_of_alternate_modes
stays 0 - usb4_port3 still has no "connector" symlink (only
link/power/uevent) - dmesg shows bindings for typec port0 only: typec
port0: bound usb2-port1 (ops connector_ops) typec port0: bound
usb4_port1 (ops connector_ops [thunderbolt]) typec port0: bound
usb3-port1 (ops connector_ops) Nothing for port1. - udevadm monitor
(subsystem typec) shows change events only for port0/port0-partner on
plug/unplug. Plugging/unplugging on the affected port generates no
events at all. One additional observation: with 7.1.3 booted without
any GPU driver (the NVIDIA DKMS module does not build against it), the
monitor attached to the affected port actually displays the boot
framebuffer. The firmware sets up the DP tunnel at boot (the Lenovo
logo is shown on that monitor), so the hardware path is fully
functional. The display is lost once a kernel GPU driver takes over,
and since the UCSI/typec side never manages that connector, it is
never re-established. Happy to test any patches. Best regards, Kerly

On Fri, Jul 10, 2026 at 7:30=E2=80=AFAM Trabajos Iafast
<trabajosiafast@gmail.com> wrote:
>
> Tested with mainline 7.1.3 (Ubuntu mainline PPA build,
> 7.1.3-070103-generic). The behavior is identical to 6.17: -
> port1-partner is enumerated at boot, but number_of_alternate_modes
> stays 0 - usb4_port3 still has no "connector" symlink (only
> link/power/uevent) - dmesg shows bindings for typec port0 only: typec
> port0: bound usb2-port1 (ops connector_ops) typec port0: bound
> usb4_port1 (ops connector_ops [thunderbolt]) typec port0: bound
> usb3-port1 (ops connector_ops) Nothing for port1. - udevadm monitor
> (subsystem typec) shows change events only for port0/port0-partner on
> plug/unplug. Plugging/unplugging on the affected port generates no
> events at all. One additional observation: with 7.1.3 booted without
> any GPU driver (NVIDIA DKMS does not build against it), the monitor
> attached to the affected port actually displays the boot framebuffer.
> The firmware/BIOS sets up the DP tunnel at boot (Lenovo logo is shown
> on that monitor), so the hardware path is fully functional. The
> display is lost once a kernel GPU driver takes over, and since the
> UCSI/typec side never manages that connector, it is never
> re-established. Happy to test any patches.
>
> Best regards, Kerly
