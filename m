Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195767;
	b=la+TjJsxrAuDkACYqdGTSl89D5xaXzvN/FLDTxgEBPnHIROPpCh/KARXFdz3W4iYx8U+
	 7g7bQjokSK9Zs6UTVjat3hg6Vp1jgCETnrUAS4uxhXIbv0j9HWsclqQ92XBl28xgNn8NM
	 m7Mcin9h2mEZ6WeBILaz53h3drHFO8qhxkFIbizjKLdOWxgnLqidRbRHG75DXHUwU9MBo
	 qzn7gdW9M92P/jK+oSqpJiV18KomQuEAory7dKmEnA+xByXU4PoGUcGf0QKXbBSoqJOpP
	 K5X496MnhdixQzP0moqmSsPXWkqQJob41rZrTrnrQTgmGCwVAZVZPddX8nOCybX02Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
	b=Ff3eHifSirn4VKBC4j0/SRFFWbcD6bfN0MiKjEar7JlgHq70SttKwjNmcXLv/ipBpyqD
	 TMwZPPBRCHXHBpEnhka7Psxi07s5txoCzcV1vTUi9EMPjUh+oNAUzNvdm/7JMBEBMMB6i
	 QmAEYEmGlJvN+AbOBy/bk1d915fr2YmnD2j8/UhA2agnW9mhgzHohoIrvnIQQ0rvtue5z
	 ciYbICpovm/e/btc5vZtogIoZle8cdNL/8liGDR0BLr/glMCA8JwDsUz47bOaPUeB3dFd
	 q0Ppj19JThT2zGQhY14aUy1CgV9tVMzKiNL12ic/nfCW2Woy6i5KVVUrCeX4xOpbrmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3GVRdg1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CC9606A33E
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63CC9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3GVRdg1
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so372031cf.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195764; cv=none;
        d=google.com; s=arc-20260327;
        b=l5nde6BrU2+83MAVplo1Ne/1s2eYLLBSc11MDBCF9x6p3I3ZdSa6LY4sNXlOkuVbKi
         kSNTYQFTFH0u4M4uzhXweeZDEVVmHKXgnfCM7vEOhcZokUU2ifxEQTtQVQGOeOqInDd3
         3JV1wuP4fj8rr7zL9AdvqrYyrmSdEk2U7UixQwb7XflXtA+HUtyuNFe59f/713CshiRr
         zCmpMyySqyW+lw5jkBE8HUPilhWcP7reQlmI3mhYO6/i/+FeRXTschqtVWcY7B0bEyG8
         7D8rur+ZirORH+HYpbjS5S+1/9/Imil0V/JkxsbFYNXu7QrSYnj+BEJuD5d3wW06DzY1
         bQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        fh=KH1l2a4At65sLf1nfhC/5pp57/IPwP622OjrAaggkVE=;
        b=NiDSwP63YlskvNidtHihBktkvAt22my9uCpxTRr3FXJW0+bYtV8uhXM/4vgeh+TbNY
         8fZfLNZt1rWXRSwi4jUftXVLcRFnxmJVommIp/tultcvP+QgIsDvGEVRx6EjOs8On7M3
         9xovBAKCmj+kJHJEOEWBn6jGcQfAg7iaWYZHu5VWP0ME2x33clZgS2IKhbBiDRAVOZcc
         KWEyRqwGNvkhp6RqqM7XQ7zmeqksLOaQdR/cfgTA7SOQlpgcs5plK5FHoRHRos7mdF3c
         20oJ1tSYxj7iJhJ1oWxrxOv5W7ML4NF0NEkDrXwtvGkIxcqtY1y6v376O+dCbmbqedOV
         SHmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195764; x=1795800564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=l3GVRdg16VPWScqmn5BZxtA7/L9oF1UcOodEIO2q1vp3rCSTc9dU02fuwKYSR/rige
         DnYKmcxXgxVWLKX+001F0giqPxrt5e5dCabvgUobgNQmOSyr9QGV3Ct6uQO4lu65aa6z
         W4P+jzNvyOI2jPBcQlJPRUxRp6No/dhs7hAVMNBmJJ6Wsuu9jnWrKoBS9FwsPoIOlIHW
         b9LZcYpzyNJm0zaAS3lY4tHQ9FHHtKn/unaGKbT47l267GkfhDrrVN4xJfj4fA9+49sP
         EkEKZJ5K0IJaQyVu8V1KKnkNaScUr4PKmNW6brE1mg3tM/SG6aPBfaVsFZTrXPcKQsU7
         /8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195764; x=1795800564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=TmQbdvbgeP+c1UL3ZxyLmIBK6Kmy2tdlMhX+dX/yfy/sUP+sc+c8SldHGa/OlybJWJ
         QfeqiG99FXD8c2+LhqUOWuDBEBVdVpFG52Xk/UNIBJOiVfjVpFMKyXzduetBaFZb5vmo
         4ts8z+3T0ZUVdGN6cdbVSJatWPwhso0Ae/MPtppaAaV8j9CRPJSkkX9OvG1oqx8A49Bp
         xHrq6S/pTbPiqnbhYzt3xrnMFVrGnqt8PQA6UxvaE9T5wvPrjIijIK2ILkHUYQMlTqjW
         +sunwZjKjRlAQt4L+rU3b2SuQ0LAd9v/yXCji5dXOLakog1M62PbDovkXe6tAXK0cIcv
         Anlg==
X-Forwarded-Encrypted: i=1; AL+hErHut2y9OSZO7BDxp41XunY6yYxYCuSPG7APu6jxs4+Gwp2EIGL4iEbG4S9r7j4D1a+vOBGexX5yWxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eYBvihTYEmXtmEVzxuFwfIr44XhT7jQP5XGXYGueVxSJSnQOu
	/LMsbVnSGwx446Q+E6g0FTPjgf2qzzbIZwLZt3HTSwT8YgYKD4gmEScx6hb6Pm1pKp5FvQny4z/
	eRtXIWeMW4LHC78g7GcR0RNMVmVj+WDMk7Hy5lzKE
X-Gm-Gg: AYBFou148f6oPDbYxkjAgk3lIb2nlOccKR6/1jKtj4nDY88q7GReJi3O4DZZBhT6Efh
	R5WfxkBTl4PrPEGBd63DnG5Wpw71rZiWANZbxpSZpAwCozoKp88ZlpSEeNlaVzoljRqLAfJoA9q
	KFQjkXh92dP5H581maFVzjkO5+Jy0tmVasw9Ba1DGIdLoiDaM2I22jtqJN2ZQMKUrLl/iUQGxOE
	TXnvSMlFCEYZyiyhUX0HLRvW6wNTGazeHj9y3DOmdo8iM85GDNnAbInAQhpvXqd4qzL+xW86gnM
	FE6mhuMdMCcHgxlcUOngqF8pKJRgWdd4GaRPMrQTgPmKKxzVTGZ/XaqHVT0qkyst7UK375uTBtE
	oc/g0hKlk7xjAJz2fS6t0F9u+pOBP1WNIcfBq
X-Received: by 2002:a05:622a:2b07:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-55d7a35af5emr20936351cf.11.1795195763344; Fri, 20 Nov 2026
 09:29:23 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170853.1529676-1-irogers@google.com> <awBiQ0S1hYnm-ngo@black.igk.intel.com>
In-Reply-To: <awBiQ0S1hYnm-ngo@black.igk.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:29:11 -0800
X-Gm-Features: Aa3M54qjIXZFwfoIO-dZiEsJTXyVaZW2PPM6ShZu-HH-RmWEeaNIOyio_jR0G5c
Message-ID: <CAP-5=fVhPeWOCmQRB3ZAkv9jS4cOgsHr_yekiLon9ZhF6Mmsdw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:08=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Nov 19, 2026 at 09:08:53AM -0800, Ian Rogers wrote:
> > In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and th=
e
> > default switch branch jump to 'done:', which logs 'currsrc', 'mode', an=
d
> > 'misc' via dev_dbg() and passes uninitialized 'currsrc' into
> > rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic deb=
ug
> > is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc=
()
> > jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
> > initialized.
> >
> > Return early on error paths in both functions instead of jumping to the
> > post-success dev_dbg() trace.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardwar=
e.
> >
> > Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver=
")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> No stable here either?

Agreed, 'Cc: stable@vger.kernel.org' makes sense here too (especially
for the rp_sel_name[] out-of-bounds read under dynamic debug). I'm
happy to send a v2 adding Cc: stable@vger.kernel.org, unless you
prefer to add it when applying.

Thanks,
Ian

> Thanks,
>
> > ---
> >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drive=
rs/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index b2ad31e85b5e..a1595b8b53e7 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > @@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcp=
c_dev *tcpc,
> >       ret =3D regmap_read(pmic_typec_port->regmap,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG, =
&misc);
> >       if (ret)
> > -             goto done;
> > +             return ret;
> >
> >       attached =3D !!(misc & CC_ATTACHED);
> >
> > -     if (pmic_typec_port->debouncing_cc) {
> > -             ret =3D -EBUSY;
> > -             goto done;
> > -     }
> > +     if (pmic_typec_port->debouncing_cc)
> > +             return -EBUSY;
> >
> >       *cc1 =3D TYPEC_CC_OPEN;
> >       *cc2 =3D TYPEC_CC_OPEN;
> > @@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SRC_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SRC_TYPE_MASK) {
> >               case AUDIO_ACCESS_RA_RA:
> >                       val =3D TYPEC_CC_RA;
> > @@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SNK_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SNK_TYPE_MASK) {
> >               case SNK_RP_STD:
> >                       val =3D TYPEC_CC_RP_DEF;
> > @@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
> >                         &misc);
> >       if (ret)
> > -             goto done;
> > +             goto err_unlock;
> >
> >       mode =3D EN_SRC_ONLY;
> >
> > @@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >       default:
> >               dev_warn(dev, "unexpected set_cc %d\n", cc);
> >               ret =3D -EINVAL;
> > -             goto done;
> > +             goto err_unlock;
> >       }
> >
> >       if (mode =3D=3D EN_SRC_ONLY) {
> > @@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcp=
c_dev *tcpc,
> >                                  pmic_typec_port->base + TYPEC_CURRSRC_=
CFG_REG,
> >                                  currsrc);
> >               if (ret)
> > -                     goto done;
> > +                     goto err_unlock;
> >       }
> >
> >       pmic_typec_port->cc =3D cc;
> >       qcom_pmic_set_cc_debounce(pmic_typec_port);
> > -     ret =3D 0;
> > -
> > -done:
> >       spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >
> >       dev_dbg(dev, "set_cc: currsrc=3D%x %s mode %s debounce %d attache=
d %d cc=3D%s\n",
> > @@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc=
_dev *tcpc,
> >               pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
> >               misc_to_cc(misc));
> >
> > +     return 0;
> > +
> > +err_unlock:
> > +     spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >       return ret;
> >  }
> >
> > --
> > 2.56.1.708.g77570a6a1d-goog
>
> --
> heikki
