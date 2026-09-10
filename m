Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7749BD80
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049145; cv=pass; b=JIP8GUrbCeaE6W1ILzHUT8eYagTBTGJg9nGN4mfpN3ZeU1GYI+CChiVlxboJ7LI+uG/qyV7M32vs7LfkkYXjkaFm+4GMicwjOgwZogpoPEa0zB7MYXr3LFDYBciCTXoNdwmR/sKIXkpqRjFLcBAXWME8L9dpAPHmHYA0hZeTsxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049145; c=relaxed/simple;
	bh=aq0XRdo/v9me8Ndky6VpXPlxv2W9RbzrTPi3mgX3c5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyq7zzEwK4CceWhtO/hWlK1UdhmKW8d8rvO+XVjvx1Of9VbFLJD9tA81e2BR/HDpbCKeEZF1TH2PYwy8XGYCswjEUXD9h6Jk8E18M2ckulg01U287j+yofZbGSndZB1dJKx/hv49dfzNyVnj/wtDVPPgqHi3NuOEpF4gVcBVH+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWP89eE9; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWP89eE9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1197808f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 07:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789049141; cv=none;
        d=google.com; s=arc-20260327;
        b=quQyMndLWLm+wRAiH3b0ftomr9sWWLkRu7aDO+euuxgWeyyEXPJIJ4kjYmZQO/kZPm
         52YnaIszVMZ+tVmVxALpsJVLv8aQb4u2nS8IxR92N2XESkycnhChDyXZ+O4q007LVxRn
         NhfVb6fj+LEVbo1Kxdr3Httqbja7G/oaiR9Z8QNReoPfUK5CMYzdR/OjZcRGhvIL/OXN
         sD49s6Ovqmyx+MGHuH0pz3HYzYapQ6hFC/qRM9sHvZ6yx3iqotlfl/JreDALnFBV9Qq2
         JK4tmyu/u0DaYG9cphSzN/1eTWC2Kv//UU8dgDD51eXwpQdbPPKzKIxsxE5sHeTAJm/d
         mpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lZDWH81kE2LXu7r7CHmw08vd9nzvrgNHOzXvRHMwN1I=;
        fh=FZvrb+RTW9RGZ2WEL29gHq3LQMICxqtdCxagAvIdpIE=;
        b=HG7m88yITWUjANxKtWmFePD0gKZRvFdoG3L5Qf+84iuZ4PxqcA4DQ7E8wLFgUQQrr2
         uA/0DyMRz4JH9jSjaRFzS7yhBXNKj5n5hmZuRHoImwNR2vNzwKpBHc7HnBvDRvnxf45e
         EJXOmWjYDfEBBL2dc2R4LVlooVylG1Ax7ejSrv9/+eNQ289/LOuGWHkGNWc3hSLxne54
         NcQqB1YOMIAiVJ900Fgxljg7GDTEcRjTnJcsE6E43EwP+uNByTAFhQDkmVcK/bcINmS2
         U6f/6hfyTywAv1PoIsKXpr04lA3Y5Xk+FJhP/WQCqRAPGFRs9TdbVELuLhBJ7WBF1jpl
         xDzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049141; x=1789653941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZDWH81kE2LXu7r7CHmw08vd9nzvrgNHOzXvRHMwN1I=;
        b=SWP89eE98ZUIl+rLQ4hfEgy12ANCb5slKuNHUSGv5mfMWpXoPRfxv5uGyPy6d0zlgp
         REbUEQO8w2nrS5kRLEQl/7IkZ5xB+0xTSks8wZrvudOqJiy76FWMYAIQ9u5KKFyltUie
         dlZ1FI79DJO1LdWGvPBi6vxfqNwfPGJFhR95AzsaPZUDdrO0PNXlPv5GLMIRlWwEDUmD
         3DZ0wG/stMC4SMs/B2WNtd1KpYk18sRKgMDD73WYTIIJwKWfHXQKKfiiC6A6j5idtqSz
         9admpQYkkICVkZI1T1aRCTrroMEZmMgYw5nrTon63gsM/DdNCNSaet0u6VNSHGZyc3JQ
         5LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049141; x=1789653941;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZDWH81kE2LXu7r7CHmw08vd9nzvrgNHOzXvRHMwN1I=;
        b=qqh1MtLV4KiPp7zy4tCl9EbNjcODau/WP1AVKbvRLwbjEU3XzTOTKBVUgGXVYiVjVy
         taDXQkxMPHtThRKqNeM2t+Pm+KiN0a7ykYcPh2Ou9E4SZq8Fy7zNYLcBONilSoH3GJ27
         4Q4L6lR8gDzx9dAiMPVy+wPoRXeOhhzbbfoCNtA6W+BvrzAc4filUCA1qFnDlksjC7Oj
         Jck+rJWzl+zUthlnIYagSa9U6WALKZK9t+7Btpno3elE+9yiFBhqxkz8Do/9RcVeISSP
         N56/q7gP+sXEwp7RJG2LfrIHYKY1KzGVRmY/vMN6BlptpGRphln99fYDHhQRN4AGii69
         gJ7w==
X-Gm-Message-State: AFuF++kSmEDKujTzaowPka/N2vPps08L5F1GAwI7IAOBzwndA6TJomNq
	XJNjzGSwnfPyFs5pMmJym0jJboQNFm6JF7fjiT3zIoO5A4nFH65tM/EWvUhsVZakWxbZX0dyYf4
	jAUrNKvyeJRJRY8zwU9KDRVog6FoWclA=
X-Gm-Gg: AYBFou3keEGGLO/LmN04rJm0l6NYxA4ErHXZNN8dNpor/ot04mvCXNEARmX4NoV2Pmm
	0FC6t+tb+4Vu7+sl4v/mg9FR39GMxLxm97ehrXlK4ndrFzCfJQ0x8KVentXnf974a0XipysTV7Y
	/CgwwoHyf9uXRrLXGkHXCWDLfIrouxoVXGQDPbS19hWcuE778N5P4BObZxt/bJvmMtu72OdYvv3
	qF4phRwY8WkwD8zOEb187AhEB6voBzxlO/RQQOlfWqldGB2+khaBcA6yEBu4C+lSmF/9nEViUqW
	AAqFt03l1Aqa9Z5xkZcA1P7ZeNkZCGqRR4zRPhExwiGrjEK/C4VwO43+/w==
X-Received: by 2002:a5d:59c1:0:b0:485:a306:1f40 with SMTP id
 ffacd0b85a97d-485c23d0ad2mr15722591f8f.13.1789049140789; Thu, 10 Sep 2026
 07:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910123129.16793-1-syedlabeeq@gmail.com> <2026091052-refueling-bulk-afc5@gregkh>
In-Reply-To: <2026091052-refueling-bulk-afc5@gregkh>
From: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
Date: Thu, 10 Sep 2026 19:05:28 +0500
X-Gm-Features: AcwNN1W5JgR5FjHBCAhO0pCqqhnFzP5rfAy32l0Onizkk4jqYsDMTWfetjjAQG0
Message-ID: <CAF4-o1fLyNVLfmRVYLAwsOMAmT_UU47XDrBD4iA0pS-=5mW57w@mail.gmail.com>
Subject: Re: [PATCH RESEND] usb: storage: sierra_ms: reject short SWoC info transfers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, 
	stern@rowland.harvard.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch on both. i hv sent v2 with the blank line and the Assisted-by ta=
g.

Thanks,
Syed Labeeq

On Thu, Sep 10, 2026 at 6:40=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Sep 10, 2026 at 05:31:28PM +0500, syedlabeeq wrote:
> > From: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
> >
> > sierra_get_swoc_info() requests sizeof(struct swoc_info) (60) bytes
> > from the device via usb_control_msg(), but its callers only treat a
> > negative return value as failure. A device that answers the
> > vendor-specific GetSwocInfo request with a short IN transfer is
> > therefore accepted, leaving the tail of the freshly allocated
> > (kmalloc(), non-zeroing) swoc_info buffer uninitialized.
> >
> > truinst_show() subsequently prints swocInfo->rev, swocInfo->LinuxSKU
> > and swocInfo->LinuxVer from that buffer into the world-readable
> > (0444) "truinst" sysfs attribute. An emulated/malicious USB device
> > (VID 0x1199, PID 0x0fff) can exploit this to disclose up to 5 bytes
> > of stale kernel heap memory (kmalloc-64) to unprivileged userspace,
> > once per sysfs read, indefinitely. On kernels built without
> > init_on_alloc this leaks recently freed heap contents.
> >
> > Only accept the transfer when the full structure was received.
> > sierra_ms_init() already retries failed queries, so well-behaved
> > devices are unaffected.
> >
> > Fixes: 32fe5e393455 ("USB Storage Sierra: TRU-Install feature update")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Syed Labeeq Sajid Bukhari <syedlabeeq@gmail.com>
> > ---
> > Resend: the first posting was whitespace-mangled by a webmail client;
> > no code changes.
> >  drivers/usb/storage/sierra_ms.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sier=
ra_ms.c
> > index 177fa6cd143ab2837640c26f8336781ddd3cf9cb..8755fda42eed2afd3235283=
e990a35aac14cb829 100644
> > --- a/drivers/usb/storage/sierra_ms.c
> > +++ b/drivers/usb/storage/sierra_ms.c
> > @@ -76,6 +76,12 @@
> >                       (void *) swocInfo,              /* void *data    =
    */
> >                       sizeof(struct swoc_info),       /* __u16 size    =
    */
> >                       USB_CTRL_SET_TIMEOUT);          /* int timeout   =
    */
> > +     /*
> > +      * A short IN transfer leaves the tail of swocInfo uninitialized;
> > +      * only a full transfer is valid.
> > +      */
> > +     if (result !=3D sizeof(struct swoc_info))
> > +             return -EIO;
>
> Don't you need a blank line before this comment?
>
> And did you forget an Assisted-by: tag?
>
> thanks,
>
> greg k-h
