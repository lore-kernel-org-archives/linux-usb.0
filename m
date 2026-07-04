Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E63A7826
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169860; cv=pass; b=K/JBOoBmPmHglHhKa4fnuZSBgXhaS7kPlu8Dds04o7wpa5NCG2znoTb5Atq3W2xheHd30v1l3P7E9gRbXTyDq64C+mToX5mj5/P1Ia8Lekwq1q/J5s8jJpq7I086cIYpZJrb1fCboitlRtKiU9AkMq3QzP5fwqICEy4nKoeYi9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169860; c=relaxed/simple;
	bh=ne9M7ihYYYmOajHK0Ot1X8HArFBEeOh79pG2s6pnrUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HP1faGgAV2TWmkSRH8GDnpuPI5UoOkOj6OU6bQUBhkJu+Pn7zQ102B9zsPxQr0COVs69dDhm+9pF8/gYv8VMvmMR45XsPHjwPLbOvOCklX8Bd8ruV/UKgNGqM5Bind3U41aF5Kle9rqJmXffvu6PuQ5+Y0+0A/Nzlt95QTJXLEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbALc1jb; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbALc1jb"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664ce3000e6so1149697d50.0
        for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 05:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783169856; cv=none;
        d=google.com; s=arc-20260327;
        b=XlbfNhXz9uv9RcMCnEcwv76GVwlfUrUK6LUT9pt33NLHTSt4JOCFf+gU745zY31Azy
         lRJqg1v/H+GZB1Ui0NAwyPGAJvXNVqN0MBAj3FtBfCM9+XR9k4KQFL94dRe0rMX+LY5S
         OVGcPSufA1PRBM9FanVbkuMPH8INs6SsQNGUO6hS3o7tO966IvcKSdK+AkSwtGYWlLrW
         sjTWp71NF2oq5te1fAreaAUuPAb4LFm4uEtsfYyF0vSj0IEBtDRDpmUJ+CwULcPoOl4G
         xFOuE5OVM3VZlHXc5eAT2KX/8fz2dUQa98mf0coEHVxDXD4/f7/4lK9DnqVF6xpl9JTq
         UG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7cb0zGubZ0KRFnA+0LoKJjJxiuxX2jqdR54QQ8w86ww=;
        fh=ZS3U4QhGTAo9DqV4YumaZVKVg26Vow9UtSiM2PUvkmg=;
        b=ZPKz7g+B3Ua5a8pobzS7KvZ3gc/Jx/R+Zq+XBISqtYskHXlowHqIhAq640FFSGUsom
         275JQJUiSuS2AmwJwo5phRn5NpibYny3XmzQ2qKfHoVXwuDZ2FlQB5XFLNOAOJgnsYzA
         jV0QkXf1LSvUHwXhOHsFdqtsWMI1a0Wad0FzmEni/CagUomS/EgpVmtEdkVOhgaHGsE5
         Z+VMfn4Ix0ajl+q1ktwckYWi5aJmXOEKjKMvCWzRRJYaaEL1CElLDobtQyu1V3wov+Nl
         5gsSJFqHFq/97adb1nXuPcWD4mJzZ/N/bapYSotn0hOsJf0mclfeupn6RcnlhNB8bMnG
         pjOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783169856; x=1783774656; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cb0zGubZ0KRFnA+0LoKJjJxiuxX2jqdR54QQ8w86ww=;
        b=dbALc1jbcfag0uXs/126T+gnlxr1OoDvgmzgjwtNxjTCcZxyTzwOmB/O4sQpNYSyXa
         3WlyyHYC1IQ6Ym0jUR8uc74fS2hB+Z/pGDhZQ1U9+VlCjcGMsr2Q4MFRcbLfnEKHvzL0
         wCsbyE6QIsEMiSNIuu/ADojiBFQSbOi2iSGziKoTstAJq4w656g/6YvNbT35MHnPyeRN
         OZoQ6xtjyMvQYAQreK3XRt/w6j1MIzC8yoXRubuHVU8ewO4y6csvrSzss81I+t94wh/Y
         3zC2z9VFqqAFKm8usTot+J+uh8E/cUQTHDdv7crj0E65oYgspDUeKiWZPH8niaxK3uc6
         UsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783169856; x=1783774656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7cb0zGubZ0KRFnA+0LoKJjJxiuxX2jqdR54QQ8w86ww=;
        b=lhJjyX+9lAkPwVGgqa+181e96//2E7QnULyiuSF33hcDT0DO1shzjxlv557nLKv5Aj
         C5cTDfcFw+Za79DtcC0Y+iUzYqZHTJOyYQNOlsVKVvVlscSfVPMzvPk1lNU7wcDby8Oo
         oIX08GTtBetVJWG/lRDU6t8RtUQJGfY60Ht5kGa31lMQf7AoisMtDcfgMOC/jfse5Q2C
         iuDmmIR8bueMhcBNreVi5QpPrVV3klvT0nBbd97PdWg4gUeP778vCxIizB3lId9AyXGe
         qrsBUqTiiu7JGQhaREB91vH9MFLcEdbbCp7NwTnLPVYZvM5quJB9EVFn4CfxTKxph80z
         +PQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHjdSvXj6xMvJvnlMZU4OE/maQor9alHYtIYtDOm5ngQ4EzISTbpuyZDT1DmBF1Ez2B+XZ4PW8gyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6JMCFFXDG5Ctbg6E+ffitsB2Dku8ZDQpBJFo8BCuTjJ7M7Yc
	U2yyDH47XvUVxv5XXijBqNAf/fF6Uyresurxns9c46E6W1q465JXiK3NFG2ajUnmEI4P+ZzCoZc
	60qzfERO5/xX6OR2F/38yGkqjRNodgBoUrKpsjJDDuw==
X-Gm-Gg: AfdE7cmYH/JEztWPbo+N8zyMEmMybaoGeNrr892TPA4ReuKgpePZh0gDE500RfwDxe2
	TJhTcDYHpdDr/TebYsloX3uLgXKblEchyKi4/U/mMnSbS29gNxtqt0aRqibiSZywePdnRBYq4S4
	AHYPCghpp3kOTt7CWsC4jjy0roKagEl3bC63r06qYqwEacHtDIWvGtwXbNX/DuEMA5JDCR9tUTm
	ViQICHViOFrkEOGxLNwHWmyyNy7e2nXTUpC/0MeEppotzB4+DJHZ3hR45LG5Eu0UdgEILLiTA==
X-Received: by 2002:a05:690e:148b:b0:664:e430:cb92 with SMTP id
 956f58d0204a3-66652f2903amr2900631d50.38.1783169855698; Sat, 04 Jul 2026
 05:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604123929.1427579-1-lgs201920130244@gmail.com> <aj8YyBVR90FGSki2@vbox>
In-Reply-To: <aj8YyBVR90FGSki2@vbox>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 4 Jul 2026 20:57:25 +0800
X-Gm-Features: AVVi8CcBp-gG66LpuDbfy_XpTX52zQKVmH1rOSHT7BDNE_-HYTMKFXAl4EBZOfI
Message-ID: <CANUHTR-yxFDtdSDNiOoYbM4358_5CS2ywpGz3eODv_SZz50vPw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_tcm: fix remaining nexus NULL dereferences
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Mike Christie <michael.christie@oracle.com>, 
	Kees Cook <kees@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh,

Thanks for the review.

On Sat, 27 Jun 2026 at 08:32, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> On Thu, Jun 04, 2026, Guangshuo Li wrote:
> > The previous nexus NULL-dereference fix added checks to the normal
> > command submission paths, but two UASP paths still dereference
> > tpg->tpg_nexus without checking it first.
> >
> > A TASK MANAGEMENT request reaches usbg_submit_tmr(), which fetches
> > tvn_se_sess directly from tpg->tpg_nexus. The RC_OVERLAPPED_TAG path in
> > usbg_cmd_work() does the same before walking sess_cmd_map for the active
> > command with the same tag.
> >
> > If userspace drops the nexus after the command is queued, these paths can
> > observe a NULL tpg_nexus and crash before they can ignore the command like
> > the already-fixed command paths do.
> >
> > Check tpg_nexus in both remaining paths and use the checked local nexus
> > before dereferencing tvn_se_sess.
> >
> > Fixes: b9fde5073553 ("usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/usb/gadget/function/f_tcm.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
> > index 34d9f49e9987..1717fdd1c466 100644
> > --- a/drivers/usb/gadget/function/f_tcm.c
> > +++ b/drivers/usb/gadget/function/f_tcm.c
> > @@ -1188,12 +1188,21 @@ static void usbg_aborted_task(struct se_cmd *se_cmd);
> >
> >  static void usbg_submit_tmr(struct usbg_cmd *cmd)
> >  {
> > +     struct tcm_usbg_nexus *tv_nexus;
> >       struct se_session *se_sess;
> >       struct se_cmd *se_cmd;
> >       int flags = TARGET_SCF_ACK_KREF;
> >
> >       se_cmd = &cmd->se_cmd;
> > -     se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
> > +     tv_nexus = cmd->fu->tpg->tpg_nexus;
> > +     if (!tv_nexus) {
> > +             struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
> > +
> > +             dev_err(&gadget->dev, "Missing nexus for TMR, ignoring command\n");
>
> This is called after usbg_get_cmd(). We need to cleanup the
> sbitmap_queue and the hash (sbitmap_queue_clear and hash_del) before
> returning.
>
> > +             return;
> > +     }
> > +
> > +     se_sess = tv_nexus->tvn_se_sess;
> >
> >       target_submit_tmr(se_cmd, se_sess,
> >                         cmd->response_iu.add_response_info,
> > @@ -1271,12 +1280,21 @@ static void usbg_cmd_work(struct work_struct *work)
> >  skip:
> >       if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
> >               struct f_uas *fu = cmd->fu;
> > +             struct tcm_usbg_nexus *tv_nexus;
> >               struct se_session *se_sess;
> >               struct uas_stream *stream = NULL;
> >               struct hlist_node *tmp;
> >               struct usbg_cmd *active_cmd = NULL;
> >
> > -             se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
> > +             tv_nexus = fu->tpg->tpg_nexus;
> > +             if (!tv_nexus) {
>
> Same here. Also check for other if (!tv_nexus) checks.
>
> Maybe we need a helper function to do this cleanup?
>
> Thanks,
> Thinh
>
> > +                     struct usb_gadget *gadget = fuas_to_gadget(fu);
> > +
> > +                     dev_err(&gadget->dev, "Missing nexus for overlapped tag, ignoring command\n");
> > +                     return;
> > +             }
> > +
> > +             se_sess = tv_nexus->tvn_se_sess;
> >
> >               hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
> >                       int i = stream - &fu->stream[0];
> > --
> > 2.43.0
> >

I have sent v2 to clean up the session tag pool and stream hash before
returning from the nexus-missing paths. I also stored the session
pointer in struct usbg_cmd so the cleanup path does not need to
dereference tpg_nexus after it becomes NULL.

Thanks,
Guangshuo
