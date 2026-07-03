Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA193D75C6
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084816; cv=pass; b=KqTB6y8tw9and/5xdnslwKhZcKXCP0oSpEhwwb9BV6G4Eu2GiHQ9Mjmwcv49FhSsCgflUeoWJ1rhgCItNniOVSpK8vaoDECjB7nWrb+8bi0Tul5WpByacWW36NDbUnVvkQVw9luvgmc3YUfar1Txcs8Od7VcN/oNGdgdKNIu7TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084816; c=relaxed/simple;
	bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+ZlMVDWY+4mpGV4AqesuI7M7JK0dbjpRoi/xhhfqzKCEOVlhuloux6+s4tZbA6nh4N/dHo5sDhY8cPoKZ9sW9dOLHxHBBuSpAoFTymRbIl8ISOxbGEN6s/U2GWlwrHCyZh0/AgxYv7LrNDULAl8kHY1RPWUYslznYoT06NSrGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=grWpVETA; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="grWpVETA"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664d530fcfdso702096d50.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084814; cv=none;
        d=google.com; s=arc-20260327;
        b=NzhGMMMQbkUKIw5oTqkY7uV4vP4L9KIpqLsRDihyxUcdRuI87Q/m3N8NPPABhQjKhy
         cTICVktRwD9EL24hnXcuuNmJmKDH1mWw/pV05fdthASF8uQefqsYxDdy8wG8ax+Tha0c
         9wCSCKhjbTP8qfQHukO4K2cogWhxXsl+JLmY3BRflCbbOX4juFdfSX1HzrzyoZV4Tfla
         udUZqoZzWYLRLb54tJ+uaII9CiK3AzeI0+R1IRvjgtYoS3iqdhOEc8jpRAEzsemlwmmg
         b4JM30v3N2qw3EWsEzCzWEPZX8A0u+K/8oAkoFM9egrud12vK5Gc219IWMU4mavWWKfT
         hU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        fh=0dcxKtIWIG4e4M8oZzwkbq5klRynH00KC9P0MV277FM=;
        b=lPVXmdNpkOg8Nxaz3kdPUTvbFeCLQD8QRLauQOSG1W0mupLWqBLBj8AB6/PfUEgQOO
         ifr3YaLtt37CDqk3n9nJICmGax1XgB54CaMxQgi4kpK6Pqgxz3thNqErMaB1oy+mjQ3q
         QwaOINBNO3cKNQOev+brS+p+hrgIbcqMAnot7dJdRonu0PzoDeIfkQb0dNDd0S3RbeKe
         R/GG+aGIvhx8w34YJ+t+W6YBsGo+khZwEM/cN3c22AJcCXte1v8SB9hfi7bh6J+EdziI
         8g+Dm76SRMl3nXho8ixhhXmqPkosjaGuixTIkmVxesLhsK2shRhndx/OBKNAFoZxZheb
         DuvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084814; x=1783689614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=grWpVETAw3jDMmUy3XPnUGOjR8BcA4jyfVk14MFE953+F1914LoGY5rwA3Ge8NZuIE
         7GcRD4+VXwKna3rqHOPliBMs5HWA4GJVOYeQwRl48oHFyGMaDoiBQQ4jxnh2KgTL19Mu
         DTB/K71gdvc4rjOGt/blrp0IXyUNL2x51yQPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084814; x=1783689614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=IHh2tX9FSFMJz+0JNY7oALSn506/7DAiIM8VCkXhztrW1VywplR/bOz5pxmcYPBW58
         HWSle3V4bn2OkL6wyRxsA8Y7qeT1tyD9X1h8t8PjzEDX4N/kBlFG3h2rRUBLrNcMjEiW
         hEG8SEtR1I+qwPYK57Zk4lQnekZC8KlkX2CJyns5mB1EgoLWvjpoQC6E4Bb6ZX3EN+rg
         /wCrbf/38tuOR3UI/9iBOPoPn/MjnKj+jEJI2ts6IINfv1mAH9sHNZlFU4ls5OzmpDh+
         dF5TRA+JqSU+FhvMeXsvcfE5ZN54rwxrvDxXfh+KVio21Q4hkOzmuJL/8YqWuc79+gq1
         Nntw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ju2X+ZxK7K0CMRl6x7iNCkeSxG3os2pxrrhvtDbxRI6pDlrdyJ0/ntibWvMI2lhwo5M42wi0+84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRp2kcnyQyB86BH4529GHKm7mp2TaKrFfJuLXKnfLSCsRmUiOs
	68agxnlPNm0xWDsnAn8apCfTuKV6XTngV1cQXHloBrvPkpkSfCEa8Qh78YITclHYpWx2ZtjRmwv
	S36aTzkjeBQCAZxTT1VBi/Vwp4dEARakYxVjLwKtd
X-Gm-Gg: AfdE7cl5WwO9oCBvrNrZ7XEsQ7gJD+7+vDCKuZcMvpKOxWZFl7qOI/KWkJ6hgUPTz7G
	5YDcRnWD99P3NubQSaUARX5eZns25eMXmMLMNMR+mzuRN3G8Ry7z8k45fnMd06ED6G1qExIjF8j
	3Fc9Dx4x3Jc0iFDUsV2oGSo0ejFveHTMVvIosrdF3jvcKuuVuBUpn0/EEVGnnzagGDNpzR1ESgD
	SaxPv1FFLLJvVNHAuYA/Kg2+aQu4GRJUGjCHC9Ow8g4kHhWSAYF/VWKwrNbhWKfwNSruj7+2NRl
	xDODsGCf6dyZeCYq8h/ie5xh6v8=
X-Received: by 2002:a05:690e:418a:b0:664:ae6a:e9a5 with SMTP id
 956f58d0204a3-66521d54781mr9923763d50.75.1783084814296; Fri, 03 Jul 2026
 06:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
 <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com> <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:20:03 +0800
X-Gm-Features: AVVi8Ccxmi-jSFxGKDTUuToCDHyjKIoBrT_lajnjop8tp06Df09KPZI8Is_qoIU
Message-ID: <CAGXv+5GH3navtUC-V--dJOEjqiDtOauXf_TKxzdQ_T+bK_v9gA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:16=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >>
> >> So this is only needed to not have to track the state in a separate fi=
eld?
> >
> > Correct. Reading the field is not the problem. Updating it is, as the
> > fields are packed bitfields, and Sashiko suggested that locking would
> > be needed, though it may have been for the peer port, which has since
> > been removed.
> >
>
> I'm not sure if it is. The user controlls the handle. We could argue, it'=
s up
> to them to provide synchroniztion. We only assign the target and pwrseq f=
ields
> once in pwrseq_match_device() and only change the powered_on field later =
with
> pwrseq_power_on/off(). Unless the user does something weird, we should be
> alright. Maybe a small note in the kernel doc would be in order.

I was refering to the status bitfields in |struct usb_port|. As you already
explained I think the pwrseq stuff is fine.


ChenYu
