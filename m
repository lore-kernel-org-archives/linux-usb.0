Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634814;
	b=Ml2N67soDhFYhyW/B4zubyLMmcweK+5RLA1mUlLnNsAMYQcVJmG0ejjBH+nIX33jH2/P
	 3qrkzxtndsV05RLxY1q0NLWo0Imrg8NVNnoti2VTrcbfYbMG4RJ8Mfa61ccmbY3qwwWs1
	 2YQJEDJcAp5H5i6hJlbUY4cKaiV+LxkG51iXmCwmOsB+2U5twHNMKsB76afW2CluqBWZ1
	 4ah2KUqc5kjSnZiuypi/5lkkYfbqyHD4aWe/dretX5cO3CLVvfd7qnUGtwUp5qzNXQ09J
	 RArzJZTxBx+UQ4NUsajAfEQF4f1RD+kjvwIEkL/JAP9eHBQjsDzVn+02/tJ6GGUwLjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
	b=Y6IhMnlIxnZfPDf0NU1I1CwqhpSZ52/GYxls4jFjpXJlu5Z/AL4R6jY0cNSVhzKdmC6u
	 fobIiORUSOi0V9A0UArcim6dHNfeLt1ZaEayjUtr8eIwQE/5sVq6XbekaPdzYOa46vXF+
	 tLeQqldpa44jlab0SRUM1b2MKxvfM1/o1pt/j43efXpdCvWBKFIXfOZgxj4RHvfWway37
	 5/zglxMP06/pSEG073UfhdRwSU0EoIGDqZlEGSRuks+YemOxlZBLtPh0a11JGaqN/J8JX
	 sq5sWjPk3Uxcaw5S068TqYhgNE/DQaLSPpl1HsBZa4HLyejSy888v36GuC4q3QlnmzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ZOhuAzqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1D160B4254
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 15:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1D160B4254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ZOhuAzqM
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1753034eec.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 07:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634813; cv=none;
        d=google.com; s=arc-20260327;
        b=H/D+7dp9hmRG1C/na5zr3dvabUDdB9R7aoolDZiSBlGCLwPcLTRk0hIJBCoaKPgJcl
         +ojQGOR3y9ECpaxbqfdPlkRJ0AB9c7yY/DFGCzjyrv8pDdTWL63MJO7lbgn77eeHkyjP
         nxjpsJd1tNuIcHt46u45fKeaIEUw0OOR/aF8TrWgvkJMwW7bV0bMSFfM2n/6UTbxgw1i
         YZUWIBUQFx2bbPcWHF+i/CLoDLrLERvqBdkR4bF1KEQjjDbzj4HbyAH/Cn052v+rjM3i
         9xzY++bOcGdq1N0g9cviGSzUOcltUw6EsnxcVP7g8CLtF4fNarQvnJrDuYEzgaf4D/lb
         ncqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=c5NtMKznGhR2iNVV3vCnq06uOdXE4JNPbeSdg2f8KP04A+B/9eH8r989eHzZbUjP5P
         Ywq0ze6/FoB0yIXxClGHdZS9XFJAwoYY+pJj9gxuKIWtLwgTYxRFBYcO/1yFLZcpiqHm
         j+EHqiC00NKL59l0f39F89oN0h/3QWMZ1Jfh4Jzf6VpunFVQ8NuekBaAbgPa/jwTacO7
         vdKGdorLKc6D3WnAszhStOU6S4WF4zmYLDAXfo5zDUkenEQKPCifnbqHtVwVp7ypx0ll
         riYASFRXasvJAbWJsg47ByW5uarLDbCzg+2u9B977VB5MBrJix4yslkFG4QY77efpSOB
         tBvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793634813; x=1794239613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
        b=ZOhuAzqMvCSWJpRlbPQOCOFHeXKb4s39LRWL9L1a+546FK2DxXeReO8/FNayv7PGq8
         z2nyPSVyBjU4h8f6kUj4FqEQexlHAVaW8gguyGHHIvr9EYV+CJQp4lAAyAYdYiNdeFsS
         wgfg03ZtORGbsdW6eBzedkPJh92eptSzUzg3moqpRAULzxyfXttPwmHVQ1hCiNSKTT5P
         fZL8frxSdJroU08h2GP8GooCmRYykA/3IChrtpyyNc8j9XYMhcYw0y78WVr6I9GzjtBk
         YThHWBXfi4+fCeFUTP0uRtpyxKdSTH93ZmtxN6mEShurLoRvKHStgHQBV/++a3evRSg6
         9zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634813; x=1794239613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3DAtsOfZSODQOuifu4egJRfeUsKk5mf6if28oMdyiM=;
        b=vJp07cp70M/Ko+e8V3kicA7ggXbj29gtktAYTgQpCmqEznDF6gceQgE0fyZjwcirjZ
         0gs8qhk+VGW9n7XvfR8R2cEX9ymVav6rGzw1BWlucnjEKh/I6puL2nGwccnY77nHqHmQ
         ZR5bzo8OQQpy7S5/15XQjpbHAl9h2jiIYAsXQbYe1c8iukWHbMjZrBEF+lF3Zapq/dWb
         RDl5jOYaVHoLJvHZZilJHMQ7eF24g89KqYmgd1Q1Gx+eYdET2fLQBg6H0j2jxQMCUWKp
         VJChW13+DW20geMSJiRzwo9lin/ZvHYBo8L9pPbiZ1jQ93Wqywcf0TtFKXx39aWQL3BK
         O46w==
X-Gm-Message-State: APuU4Z99be+tj1NFKRj6v+d2afPgQHodxK2LRI/MiRVuyHRw4VuQxWGV
	iQfdCJmNzIzBt6kceUKNskvemRGXRPU5FGZjKjVV7x4XPpuRocBil60zvB5uhuyXuMRzJ7BmNfu
	FCngbBbV/3p1Pm/5Ld8mQoztoGUvn700VU4eyGKsYR0PJblqC0eAz6NmYKQ==
X-Gm-Gg: AYBFou2PiPOiajaOzwGzcyWQ/5R6ps6gXdN/oLED1kvJJG9go0NPjsI1XzMLr7Lyu8Q
	4k2NMx7uFxn/8uEWjMhgZwSGyA+BxfcesKBYnGdquXKXpbBc4YmHOz52jSiQ4XcEgfnsxeK5YwE
	ZNIWTOzA9Pp4yhK5noJdMnrmySUklcd4eou0yiZGf2fHHA3ShSr0iUT651XWkl+hbfmdqyx/Das
	XmnD+rplz7c1rw7C0kGYLoYSb+6ZlA8etdB4QAKWxcwGQZ5v1WFOXUtbP+iMMKEYSFel89WTa8/
	2UjaXkdL7CHfupqEY+xIIvBFXSgSMU+K74BbeE+ukdwt3TrfF992fB9zBOO/bCQONtQIRRr7WgM
	Ylb5CcWsrnAhlaVYIf59GoBzdMVZHHxUTn+NUa62r2p0ZuM8rJsGMUP/I3Lkw6ZtDASutxQ==
X-Received: by 2002:a05:7300:7a8d:b0:369:fe4c:b48f with SMTP id
 5a478bee46e88-36a420583a6mr13496102eec.0.1793634813255; Mon, 02 Nov 2026
 07:53:33 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-tcpm-discovery-no-svdm-v1-1-54bb9b613065@flipper.net> <sashiko-outbox-193554@kernel.org>
In-Reply-To: <sashiko-outbox-193554@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 2 Nov 2026 19:53:15 +0400
X-Gm-Features: AclHuK98Hd8EV1zzuP9BPO6AEe0T1OXHvThx527c48i3Mv-cHoWW_7qC6eEuJW8
Message-ID: <CAKTNdwGTEA0_MKsXNpqYqsZneSuVmt6uJhV0mjwS8=gdobaEsA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Complete discovery when the partner
 lacks SVDM support
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] usb: typec: tcpm: SOP' Not_Supported in tcpm_pd_ctrl_request()=
 halts discovery
> --
>
> commit f5763c417e2367d11a45635b9af7ac9ca073d24a
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: tcpm: Complete discovery when the partner lacks SVDM support
>
> This commit marks VDM discovery complete when a port partner responds to
> Discover Identity or Discover SVIDs over SOP with PD_CTRL_NOT_SUPP,
> avoiding an infinite loop of discovery requests.
>
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index d721baef52104..e21fe544b2d4b 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3908,6 +3908,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_por=
t *port,
> >               case SNK_READY:
> >                       if (port->vdm_state > VDM_STATE_READY) {
> >                               port->vdm_state =3D VDM_STATE_DONE;
> > +                             /*
> > +                              * A partner without Structured VDM suppo=
rt answers
> > +                              * discovery with Not_Supported: there is=
 nothing left
> > +                              * to discover, just as after a NAK.
> > +                              */
> > +                             if (type =3D=3D PD_CTRL_NOT_SUPP &&
> > +                                 rx_sop_type =3D=3D TCPC_TX_SOP &&
> > +                                 (port->ams =3D=3D DISCOVER_IDENTITY |=
|
> > +                                  port->ams =3D=3D DISCOVER_SVIDS))
> > +                                     tcpm_update_vdm_discovery_state(p=
ort,
> > +                                                                     V=
DM_DISCOVERY_COMPLETE);
>
> [Severity: Medium]
> The commit message notes that a Not_Supported reply from the cable plug i=
s
> left alone so that it cannot cut short discovery of the partner. However,=
 if a
> cable plug replies with PD_CTRL_NOT_SUPP (rx_sop_type =3D=3D TCPC_TX_SOP_=
PRIME) in
> tcpm_pd_ctrl_request(), doesn't leaving port->vdm_discovery_state unchang=
ed
> still stall partner discovery and repeatedly re-send the SOP' request?
>
> Specifically, after the partner ACKs SOP CMD_DISCOVER_IDENT, tcpm_pd_svdm=
()
> sets port->vdm_discovery_state to VDM_DISCOVERY_PARTNER_IDENT and probes =
SOP'
> before discovering the partner's SVIDs:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_svdm() {
>     ...
>         tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_IDENT=
);
>     ...
>         if (IS_ERR_OR_NULL(port->cable) &&
>             tcpm_can_communicate_sop_prime(port)) {
>                 *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
>                 response[0] =3D VDO(USB_SID_PD, 1,
>                                   typec_get_negotiated_svdm_version(typec=
),
>                                   CMD_DISCOVER_IDENT);
>                 rlen =3D 1;
>         } else {
>                 *response_tx_sop_type =3D TCPC_TX_SOP;
>                 response[0] =3D VDO(USB_SID_PD, 1,
>                                   typec_get_negotiated_svdm_version(typec=
),
>                                   CMD_DISCOVER_SVID);
>                 rlen =3D 1;
>         }
> }
>
> If the cable plug replies to SOP' CMD_DISCOVER_IDENT with PD_CTRL_NOT_SUP=
P,
> tcpm_pd_ctrl_request() finishes the AMS without advancing
> port->vdm_discovery_state or queueing SOP CMD_DISCOVER_SVID. Because
> port->cable is still NULL, every subsequent run of tcpm_vdm_discovery_wor=
k()
> will re-send SOP' CMD_DISCOVER_IDENT instead of moving on to partner SVID
> discovery:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_vdm_discovery_work() {
>     ...
>         case VDM_DISCOVERY_PARTNER_IDENT:
>                 if (tcpm_can_communicate_sop_prime(port) && !port->cable)=
 {
>                         tx_sop_type =3D TCPC_TX_SOP_PRIME;
>                         msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_IDENT);
>                 } else {
>                         if (tcpm_can_communicate_sop_prime(port))
>                                 tcpm_update_vdm_discovery_state(port, VDM=
_DISCOVERY_CABLE_IDENT);
>                         msg[0] =3D VDO(USB_SID_PD, 1, svdm_version, CMD_D=
ISCOVER_SVID);
>                 }
>                 break;
> }
>
> Similarly, when tcpm_handle_discover_mode() finishes discovering partner =
modes
> and sends SOP' CMD_DISCOVER_SVID in VDM_DISCOVERY_PARTNER_MODES, a
> PD_CTRL_NOT_SUPP on SOP' leaves port->vdm_discovery_state in
> VDM_DISCOVERY_PARTNER_MODES without calling tcpm_register_partner_altmode=
s(),
> causing tcpm_vdm_discovery_work() to repeatedly re-send SOP'
> CMD_DISCOVER_SVID.
>
> Should a PD_CTRL_NOT_SUPP on TCPC_TX_SOP_PRIME fall back to SOP discovery=
 in
> the same way vdm_run_state_machine() handles SOP' transmission failures i=
n
> VDM_STATE_ERR_SEND (advancing to VDM_DISCOVERY_CABLE_IDENT and queueing S=
OP
> CMD_DISCOVER_SVID on DISCOVER_IDENTITY, or calling
> tcpm_register_partner_altmodes() and marking VDM_DISCOVERY_COMPLETE on
> DISCOVER_SVIDS and DISCOVER_MODES)?

True. I've simulated that with two TCPM-managed devices on two ends of
a dumb Type-C cable, with one pretending to be an e-marker in addition
to a partner, and this patch does indeed put them in a SOP'
CMD_DISCOVER_SVID loop. This takes a non-compliant e-marker though.

I'll add a precursor patch to address that at the class level, and
send it as a mini-series after waiting for any other feedback on this
patch.

Best regards,
Alexey
