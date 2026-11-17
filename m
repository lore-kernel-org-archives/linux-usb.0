Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916891;
	b=nwRXkSEKGDbTx5I01qd1Lsxpp27NQqEhZnGFp0Xv0h8HrUzXn/OBYSOlJ+Q7+exMuOHX
	 uZFiO4IZ2ypNopyHpCFQ/zxhXYucE4PBU2f0XhEMmjN2ujnjzu+hAYdznddnZMyUXIt+O
	 T0n27JXaeBMazFaYIs7kva1BepwrnSBmNV4b+ELnKNbyIB4K6iDNeQzbr6P4XcdAaq/1m
	 XioVgoZfwURGkiKh4jNRHSRmgoTrTXjVs7nowhvwSN4aJ9iQWc8XNTGwPXL3M8Dy0TgXb
	 VZ1EAbBqfPwjWD057apYnWSJzxQA5GpSgYnxLrgzclDTbU/Q6agJA1F+ZiwceynF/fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
	b=pZsnEHIX71XfW8CSaiEkqRrwvGx/SCdx9TAUgl14mpIqBKP5Q0WhpfpcLn8lECL+u6BI
	 joeh/8xZdJuvZsDzzgucAX+0uNQ+TN3tNkZG/VOkvp7ou3DXlX1lx3uEON3MFRNdfaqbn
	 c47sxa5l8EuHWNFTm89K6FYOiXpl5MRpGq1UJp2ySgHajOJevqymqHdQ2DpEcK8N5+9SZ
	 zxVawanPZzzA90y8wKYmrlNsDMIuYPvfu4sO1q7z2FbaLOUqpiDr9TuT7AiS2hGXiFO1V
	 PFPJzM7Q77rBtzDm2qfklnNA77mk/uOz3DMyhLJvB1RBzr3cctGUVkmPhf9E11ZuWIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=CzZeCb6d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716E8606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716E8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=CzZeCb6d
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso435596266b.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916890; cv=none;
        d=google.com; s=arc-20260327;
        b=MxxL6y2tPU5i85F3BQUMSipX4scaYO5VEkh7l/nrM9ZK3uGphBfi83gOgTT3kWfT/q
         FPL51rJi5Tz05kWIHKyUG4dhigEqhnLRPWoR3JhB44j+zhhNQBqEtICqYiRs5tBgTheM
         jawPA9eEfVySEYxCkYMqwz1UjDXJ/8152JfUULsjA5hahuhx1xSqtzwtk78M212HqesM
         CmrVMvydSv9TIbMYPcXjbUp7gjHP2RTKV7PfxgxHS9AY7mx/qKbYBeMU2//nRc2uwtLB
         jEaR5tmIvepxNAAMNFE6waRtu9ISKRglwINMJvW8vz8gGNYYZFNaSeJy2wm8fK0esjMP
         vt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=cPJEOZdDy3bu5zOaoDVA/iwPkZS+SgNWuP7KCxSM+CgDSkXRQ9lunXM2LwzxKT5wlJ
         nnEbmUsLoK4/0TP+2FF79/+Ye1DvJptglwfMs5kQBmxZzd32HNOe6PrOxgI4rZqd8k2S
         mE5KunzO3gkiDqeQbfnjnY8H2C7W7gLXXQdSs0x+OxxmQ+MxbkndWmBWaIogl+n66t/Q
         8IByaCVjg+X6n8y2ZCyi77X8+5zASAd6Aatz9nLxvANlhsV9ADaQIRwYdS0xlEzsoAJc
         Q9W/ClwTZN/UnPyrsgK/7N8HPAvZcM4QI6SiNXoQ8soiKRVsXQ4N3oKnue+sAhUPO6Mf
         xkkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794916890; x=1795521690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
        b=CzZeCb6dx6Kh+L00Txd6zHBPuZrlAit82pbE+arG6Fr6eFH4Y79jlV5kbCKs4qEoFa
         /62bN5MSi2XHPlZ1CnySjjL0wHqA+b1RcC5VuHRliDiRvnRzVPV4+I4oHOgpmsIrmJrT
         l/9on7Mc99dIVFqxZaJ6nsEasXogToOfhEf+alIern5/D1PcPUYneq0onQbxqFodtou8
         +DfoEjFIan8JwiKJt1kL4E3LCC3aWaGF5aEhL3p22Wm57Z58mXvJ/sKeoOSFC2kfJQqY
         HowQSwFOHmpSzoevvklDn57Pv+vwvKrp9KQJvK/zrrvk3O9Fm9ugirM6JzviyRT+hfuj
         G/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916890; x=1795521690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9a9wV4olLvKzImOmQITgwt0CleZ0jOaoa4gJGOuTPk=;
        b=NZeoTp8Eiao/wYB9l9LdiFLKkKnzNhyNl0/TglqvY9eil7C2lSvn4p1mrMzG6DsEBO
         QtJu+VE3IxIBF+VYG0C4zW3iCiftph7cGkdVEZEMnlU8kEsyyau71P6kI1VgoVzjBryQ
         VEDFYcos0Ubty7+yl1dh4+n6cr0idVT3VA2mR37BEnH75ibzU0RRzn58UTvfGAEYSQbU
         Ty1IqoKGCNhhTNpeGZEH0M3JxKKBv6244LQ0nb7+ZBRHEZKm5IO9h6hYxmp0tCrAQ5oq
         UNJqd0tTFarqSzp5U7WWk/J4nrQ9NfVZZK4OxB4wIGfikxPGF+dHDtnYD8yp6iDavmGJ
         ff+Q==
X-Gm-Message-State: APuU4Z+EKK0wuuc3nQa2Lc1ZZoDg5le/yjlZR258sA+EBmLSEgGsH8z1
	luq0AZjkrWrBGssCWeePNNDqON5wP9MyZizZSF8WJI/8vrPXZ3OeQb8Y43PjpeM6lnGmHXRVeVF
	fM4oIjLqHwlRdVDJUSp+qThbWqNntaPo2Iknx4vaIP3/xTJDg4zFXp3c=
X-Gm-Gg: AYBFou2gF1kj9HP/vhTvlk362pLnKzItAs8gunZw9J6ljke1m92F6KBu+SRgKP9sHEV
	YBhbMg/aLEfvztB2E54ffHo9gAnRU3xAEn4ClLrryu+t7OlAF3CW+nkcbKKO56fDfHDXlXFg4Ns
	8YRbc0S2Z+vQB6+niTtWbTsULOYQCvyy/1bN1kkh5i7xtS9SvjjXg7CFkLST/NSRCFWH9MVMolE
	dF5mMQR/6fhmBQ4CgI4hIhhd5C0UxD7GPL8s53QZMj6bsVkiZJh+6kJb7UBuGOgExG3GsCqZAIC
	aF8H13ODSXbUe16iiQFqkJap8QalX35mws/iJS44n7WZkya4K47ZjznsnuwvamrfjRuzGMcRpXg
	K7HhozZc/tLl8u04E+4dC5LA7/ejJPQCXYupsOmznj2oBLu6m3p11xFIf3wP+31zxpt4ghNwWJH
	1xAxwRwp4ykECK1RE=
X-Received: by 2002:a17:906:f59c:b0:c42:102f:15f0 with SMTP id
 a640c23a62f3a-c509614d4c1mr1061020966b.3.1794916889480; Tue, 17 Nov 2026
 04:01:29 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-1-c7e1543828c0@flipper.net> <sashiko-outbox-218712@kernel.org>
In-Reply-To: <sashiko-outbox-218712@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:01:18 +0400
X-Gm-Features: AclHuK9zyk3sN3vYB_U05kdu-HfgPLCLfSCbrpw3lIrpG_3_fsGrO03RmZX3p2g
Message-ID: <CAKTNdwGh=7JLbn7y4qJK8BxfvcczgZPebBF8XSiMrZGKa7cE-g@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Keep the Soft_Reset target apart
 from the VDM one
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: typec: tcpm: stale upcoming_state in run_state_machine()
>   sends SOP reset
> --
>
> commit 2100338173ee82724a16da9e2eef51514fc95f54
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: typec: tcpm: Keep the Soft_Reset target apart from the VDM one
>
> This commit splits tx_sop_type into vdm_sop_type and soft_reset_sop_type =
so
> that VDM transmissions and Soft_Reset messages do not overwrite each othe=
r's
> SOP* target.
>
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index bb90211660cae..8c5be904d7725 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> [ ... ]
> > @@ -6220,7 +6225,8 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                * A Soft_Reset Message Shall be targeted at a specific e=
ntity
> >                * depending on the type of SOP* packet used.
> >                */
> > -             if (port->tx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> > +             if (port->soft_reset_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> > +                     port->soft_reset_sop_type =3D TCPC_TX_SOP;
> >                       port->message_id_prime =3D 0;
> >                       port->rx_msgid_prime =3D -1;
> >                       tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET, TC=
PC_TX_SOP_PRIME);
> > @@ -6439,7 +6445,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >       case VCONN_SWAP_SEND_SOFT_RESET:
> >               tcpm_swap_complete(port, port->swap_status);
> >               if (tcpm_can_communicate_sop_prime(port)) {
> > -                     port->tx_sop_type =3D TCPC_TX_SOP_PRIME;
> > +                     port->soft_reset_sop_type =3D TCPC_TX_SOP_PRIME;
> >                       port->upcoming_state =3D SOFT_RESET_SEND;
> >                       tcpm_ams_start(port, SOFT_RESET_AMS);
> >               } else {
>
> [Severity: Medium]
> When port->pwr_role is TYPEC_SOURCE, can resetting port->soft_reset_sop_t=
ype
> to TCPC_TX_SOP in SOFT_RESET_SEND cause an unintended SOP Soft_Reset to b=
e
> sent to the port partner right after the SOP' Soft_Reset finishes?
>
> In VCONN_SWAP_SEND_SOFT_RESET, port->upcoming_state is set to
> SOFT_RESET_SEND before calling tcpm_ams_start(port, SOFT_RESET_AMS).  Whe=
n
> port->pwr_role =3D=3D TYPEC_SOURCE, tcpm_ams_start() transitions directly=
 to
> SOFT_RESET_SEND without going through AMS_START, leaving
> port->upcoming_state set to SOFT_RESET_SEND:
>
> drivers/usb/typec/tcpm/tcpm.c:tcpm_ams_start() {
>     ...
>                 } else if (ams =3D=3D SOFT_RESET_AMS) {
>                         if (!port->explicit_contract)
>                                 tcpm_set_cc(port, tcpm_rp_cc(port));
>                         tcpm_set_state(port, SOFT_RESET_SEND, 0);
>                         return ret;
>                 }
>     ...
> }
>
> Once the SOP' Soft_Reset completes and the state machine returns to
> SRC_READY, SRC_READY consumes the leftover port->upcoming_state and
> re-enters SOFT_RESET_SEND:
>
> drivers/usb/typec/tcpm/tcpm.c:run_state_machine() {
>     ...
>                 if (port->upcoming_state !=3D INVALID_STATE) {
>                         upcoming_state =3D port->upcoming_state;
>                         port->upcoming_state =3D INVALID_STATE;
>                         tcpm_set_state(port, upcoming_state, 0);
>                         break;
>                 }
>     ...
> }
>
> Because the first pass through SOFT_RESET_SEND already reset
> port->soft_reset_sop_type to TCPC_TX_SOP, the second pass takes the else
> branch, clears the partner source capabilities and SOP message IDs, and
> sends an unintended PD_CTRL_SOFT_RESET on TCPC_TX_SOP to the port partner=
,
> forcing a full contract renegotiation.

This is handled in [1], already reviewed by Heikki, and also tagged
for stable, just as this patch.

[1] https://lore.kernel.org/all/20261103-husb311-cable-comm-v1-1-6217dabc1a=
85@flipper.net/

Best regards,
Alexey
