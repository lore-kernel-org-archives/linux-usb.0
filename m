Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC8529408
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271297; cv=pass; b=tTdfWq0IXyOjT0f+QFJPlm2c7EIWqR54iicJcwF8MC5TEsBMX9VTIzpi1sulQCtIwEpQVbeGp0Uf/KaOLjEr/11fHR7F2JTiVTeH3knmdXPwZUY0cPdqH7tV4S3vV1icU1ysSw1a6xcgOblyG/KIW/accmrtwPg7dwPHPdKmu34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271297; c=relaxed/simple;
	bh=P7+az3yyBJchUR91Z1ziGlXJNmLdkAluzh6AwSulzz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL+gpF6WDCtVEr+9wREAnjVlORF5gsKJYkDaWx+c4h+AN4WvsfK5BcrBmYIimkGe1zj5z4ns897+8MbJ9Mi9mD0iyST89LHT9Yje9wedbYtvAwgAjcf73F0zmNYTyFhK7LHdUxLdNw6DUC01dF1mD5t+IpgBt+grXrqX2icDxj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ng02IZlG; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ng02IZlG"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4bf948737e1so83590b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 10:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790271294; cv=none;
        d=google.com; s=arc-20260327;
        b=aXC0m32HBRQm9jnt/fsZtGHaF0VeKsl/+/l7cwMdlbiqI94nqtP0g7dAXaOQh47V4j
         jAJX0VLFEInX/RD3uEbZmuWqWPhEl9MgX7KOm3UE42RCggkeB4u6ceSJmRjfVYDiOQEi
         t6j/7S+b/1dXMSF6ryFzZRnXGQMGl0VTMP7j3wQWZqRUHBBvWuPrC0bkvdbUPuwzzjkt
         8yp08LSHof4y3ugrf+HEulFYqTy6wvF/dJF2dZ0JK7Pcw6DMFKCD88BFd0d7RxqLZH9r
         mB0XxWkKs9X48W/6D78hkGjQwkAxneuKeLn/ebgWKRQMTyvmZt0n/SnxY8Z5BttDX8q8
         tRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        fh=qdXM1ISQWdIe5u3/V6iCDT8qI4gK48Hlx8DaCqfxzCg=;
        b=DZGAgSWiP6qPPT/nhm/wptY7rJ4lIG1kA/+pMyoF/kxSKXiT0PiPV1kNlajNHeWmto
         VAbhYTTqC1dudbY8l9cAJE5UQ7w/xblDVu7MUdM5aLk3dkInu/dMJt5qIx524CSAwvuQ
         2iaJbbN5MCvYqIKlGpe5nIcwi40SFcmZzWR8rwbeunV37u7g0w7YC/85Ev55b1bj+o/m
         LgaLqPyaQ4QhopRLTYeT2RSLaD/3EDp00fXI5MW/AvYWspZHvKiwPYZ+PjMESnLZXt8V
         7A2TX/KmLunPi5DmvYDQMoo57lh68lel/rJ7+DoPEqYX6fyaTwbmzzXuVuRW0ujHsqxy
         rk0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790271294; x=1790876094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        b=Ng02IZlGeBnlU1B5JhYIZ6omlIHwsAyUf8Et6A87amG1+fLTltDyT6CDXyC1wP2+k1
         ZOdE9NYHNpfjS9OM2PuJ7KlMNfMMdTtqkHuck9XKMIzQOsxeLYqVH73K1XKi9VW3Zbky
         Eb8Lw9cCu3piwmAudKZJWjSgNE8PCyUSUoTKNxuZ6PwjIqBUd+pRkqPFAKyDKX+rql71
         qVAoTiSiQmUrR6egi7IaE85c0WgEWUIdEksvhsl5Gt2OsiVQ4ZbNC7qA8dCN+WbbbNtM
         8bJrF618ZvpTcZO0f5Bj0mHQGYro8ivn0x/fFdsXEOyKBqB6ECMhDrXgeZZ6xAD7EZcc
         kryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271294; x=1790876094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3LlUQJdHFv3q79AvrsTmGXMAeRGwjkC4yOozzaFl6k=;
        b=VvLp3LiqdWMOn5+3I0q5URYvTNlpX4Oh9Ktveg/UyojGQ4RNwSLIpeD6pZtm1L1son
         AG7XVrr8GSIL5H9Dq4W0tpSWKcJH3ZdEMWnE0TmYlC9ZtayCkfM5v/8klexxRGnTWYje
         qRfd1v8DIpqkbgQRMQ2zCmqhmWH+fFe4dN8kK7+l7g3k140WX5A1YK/tUCHk04udBEVr
         0npNNxmv6Xkost6sC9qxEELvlAv2mCdlh02FBaRqXIgJkYWn++6pfVHACmdllZeUkdl/
         YzgUXNnRgt2wLSYV2/WfmgmUh8CuIaYYaqRJ04J01MAjbgA6JGl+uG9eOn2Z6Ud6/Laj
         l68g==
X-Forwarded-Encrypted: i=1; AKwUvBy2LnJP3a7QSQ8t26JVCIoH/kArlkCb2vT9al/aV7/voaTKKQgcaNp8wu5oyK0/MgRiGEgEfCFuVzM=@vger.kernel.org
X-Gm-Message-State: AFuF++nWpn8zqP/Wahl9BLURQLLGb1vytk7tVWtFf1RdoAV8ZQuf+OMP
	xshQkjYedgHKSqLXwt19UAsG4VPt+p7O7hkeUJyrEpu/HAzboX0CgD5TJteyEHMZwpQ0byKaGbo
	XrBnVU3AGA6kBta/r1KZHJNraW5yqi/EN0/F0lzeb
X-Gm-Gg: AYBFou0iuNrNphBUDvQFkrgseSaNJfGGuP7wCm/ua3Tzw5FJRsXgHjRkHqb6lrKMqXQ
	mpx0GXYO80RuS7Xb6WY6bFocYI2UxniV2g6x50CleuG0lGVQLQr0XYp4ieusXD0izL1Yt8d0zPt
	n1wSrek6wfLYi0Rzk+MQJB9r23SlJA6vBkH6FrVqkTSlxhbaUbfv6FLIkc9giD3+Il8vuBFreba
	nhtKlLsBUkyolJnE2ZXxOw4hxNe7ryjO8+Xo/JKnp2IJsGHP5UpT/vMa6iJBTc5bnNB2841NUOZ
	oAsjbJECIVS+Nq8mPJsL9PHUnaV9x0s+w+Ylxd4XdQkhdyAnglgpR1z2YKT/t+CXnJfus1vScXu
	YWK6yJv+H
X-Received: by 2002:a05:6808:16a8:b0:4c3:95d:91f1 with SMTP id
 5614622812f47-4d728c29fd9mr3339337b6e.1.1790271292781; Thu, 24 Sep 2026
 10:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916043957.3362995-1-xu.yang_2@oss.nxp.com> <arJdb9kip_YCzjV2@black.igk.intel.com>
In-Reply-To: <arJdb9kip_YCzjV2@black.igk.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 24 Sep 2026 10:34:41 -0700
X-Gm-Features: AclHuK_fQ4a1sDCLA9MNnm5rNq9xegB11a5TSGfdfhcIWsSj0kYwqVQmb6LZFsg
Message-ID: <CALzBnUG78eno0Qbv0Hg0_LeqKq02Gmcsiwwee03ju6-OGhb4Fg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: advance vdm_discovery_state on
 Discover Identity Not_Supported
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, badhri@google.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for tagging me here Heikki.

On Tue, Sep 22, 2026 at 3:50=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> +RD
>
> On Wed, Sep 16, 2026 at 12:39:57PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanis=
m
> > for Discover Identity VDMs") advances vdm_discovery_state to
> > VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
> > advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.
> >
> > This can re-arm another vdm_discovery_work if the port is going to
> > respond with PD_CTRL_NOT_SUPP to the partner.
> >
> >   tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> >     tcpm_queue_message();
> >       mod_tcpm_delayed_work();
> >         tcpm_state_machine_work()
> >           tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
> >           run_state_machine()
> >             case SRC_READY:
> >             case SNK_READY:
> >               mod_vdm_discovery_delayed_work(port, 0);
> >
> > If both the port and its partner do not support modal operation, they
> > will send DISCOVER_IDENTITY to each other infinitely.
> >
> > Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
> > well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it c=
omes
> > from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes fro=
m a
> > cable.
> >
> > Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for D=
iscover Identity VDMs")
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: RD Babiera <rdbabiera@google.com>

> >
> > ---
> > Changes in v2:
> >  - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko

PD Spec indicates that unsupported cable VDMs get ignored, but it is
very much valid to keep the filter in case a non-compliant cable returns
Not_Supported.

> >  - kick off vdm_discovery work to continue working
> >  - correct previous wrong fix commit id
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 2d6b14aa2085..5cea820e00c4 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3891,6 +3891,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_por=
t *port,
> >               case SRC_READY:
> >               case SNK_READY:
> >                       if (port->vdm_state > VDM_STATE_READY) {
> > +                             if (port->ams =3D=3D DISCOVER_IDENTITY) {
> > +                                     if (rx_sop_type =3D=3D TCPC_TX_SO=
P) {
> > +                                             tcpm_update_vdm_discovery=
_state(port,
> > +                                                             VDM_DISCO=
VERY_COMPLETE);
> > +                                     } else if (rx_sop_type =3D=3D TCP=
C_TX_SOP_PRIME) {
> > +                                             tcpm_update_vdm_discovery=
_state(port,
> > +                                                             VDM_DISCO=
VERY_CABLE_IDENT);
> > +                                             mod_vdm_discovery_delayed=
_work(port, 0);
> > +                                     }
> > +                             }
> >                               port->vdm_state =3D VDM_STATE_DONE;
> >                               if (tcpm_vdm_ams(port))
> >                                       tcpm_ams_finish(port);
> > --
> > 2.34.1
>
> --
> heikki

Best,
RD
