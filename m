Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2284CCDF1
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217349; cv=pass; b=f5FLCVozIkP5vSF52AjD/JY0/GXE3we2WUYX/a6+Nmaap72Saoog3g0hO5qxfLZ5q0BzisoWU+B18heT6w4D1zVp1mXxeYY/iQLy4WkXxW44dDJLDcBOFMdx9bNqq8/K6F6upfQFM90tvhOdW7X0ZuaCvxX78/f9E42k797sPaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217349; c=relaxed/simple;
	bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+BWDwKCCCmRl5n8JYWfiHLCUNjTPH7MhlkiBQAhPw+cRZL3zoiaK6T7IinI3LfGME//rJI5OSHUPPmztf5Ab9YX1uxlzT+T0n88v9G49Y+IQ2guqUEOqwGRJfH9WVvxmNUXhvyiWAwRT/17gliC1s/Uf0cwZDWNWEc/gGsAWe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifAx9q3R; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifAx9q3R"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5f5d37778so477428a12.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 16:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788217346; cv=none;
        d=google.com; s=arc-20260327;
        b=a5hgK5DXCTzjrbJnBKHJFB/hoIIIlJk7lPeDbtIjO7RYjdxVuYi/4LK4QYJmJgE7o3
         kcTq4ee6hxGjH2xfx9hsHOe78isUF0xpuYYA/6xrJ8MLh0odm40yD1budxLStvB7JNWS
         vOzB6LpP+M3gqQj2QJZ1zRo+uINJgTzUTS/VFN5vvVjiiDFHXuv3JU2bhqohbAiXTlA+
         09u8x5QPuBDgdjQGkPEEA1M31A4fnRNCSXSC8mXZnLZhiUKV0FuKLD6vPxoD/gZ2MG3I
         s/jn+zjZgip8eEMwfhJ15iWOhgMT5u8gnJmHb0bHuGNJFAJcsIehbYtTlS/qgUNv9zm6
         /Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        fh=KPG0AgdXyB5FDgZhS1aXjL8S1/oQLTj4IHuqVxdfzkw=;
        b=GdF6cb7OuhXkCYqXhgKS2pv/csA53RZzxc37ykEzW5ZxU28WRnOCV3kgQCoWA4jrlp
         59bzSG9NmO8O+u5gbh7N2UpOaGa06PS9Y3Q595JoF/UESdHNeF2ihdrovo7me1I2VmZe
         UlzcWfsMrMZ3EOHTknxeqjIZylJ6HcDKY68j1ezmkdGiiwbToaMQ5xXMZvSXgWC+INmP
         vXvx1XDpdvo4ly+/+fDQt3hE5nXSJ57OHY7itUJVDdzoqkQeH3orhvmx45T1yR6mNRux
         evZSSrhZkaFGjAI8ecgz+uwIIPl4f6mPv58l1cBLwz4SiiS3TTjTHmjzVMzPz6FSxU6N
         k5BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788217346; x=1788822146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=ifAx9q3RlC6ARp0ztxGHiYF8R3lsuyHdfd75Sqji3lFJLwP1kpmViWwvQmd3/yfyf0
         KDR7P0k+mJVSuHGHi9j+Cp30NtYgS7RSnqe/9mj1DIQapHsSAYDHRdYi6QCDWPEegnva
         Q1LwIQMU5eX65XkPV6ONsYL0ILxwlwxtBIK+OrdH40x7apHzJpTM1vL5jLVuDjgf/RRe
         1NXEWoMdp1XPBhOzgUnNUuOqrnuNNC2zkwvQDdXHa+XolulBwfBR49ADVuqUlZ74oufe
         uwWazj5+wpTOwCjT5pOhOa/vx2mfBAyq4Od3vJjLrSSh844fV1Y8S5U5wifmNeX2Ees5
         0RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217346; x=1788822146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=djeNZAUXzxricXkSVnO1lLsRJsPgBHfVS2aOq5eT6Tf6ttuhWz5A82/aLphZ/sQxt5
         iCT+LX9qrlz/2HaNybcWN5r+BHpcEhiUA8nSVZ/9Eu4U1kmWuvR7k+HQn7+8Omic7JCg
         3v1e9B0cGTdWIGkl6SEb9ThavdLD24Vggyek4lgYUkVz7IAQvqqfF5+wXrZAhxDJN0Cc
         vi+7zwz0+mMGYlPWaaWrOZS9fN3IHMArN3Xx5uK4+eVAejZgWJp9k4j3QZ8HGrEfPqfI
         PrlDu25+F0L+tqFzibS5zOdA/wQchgK+I+mRCEQVBxTRCpZfAlUxa2XV2AE9sYs3yP7x
         eGyw==
X-Forwarded-Encrypted: i=1; AKwUvBz+E6obxzFLnS1tMFeSY/iqa5VZ0mMG7ZjeYovEpuMQtnKeP2w3bTilG4iKTblefFXuxY/e4FGHDBU=@vger.kernel.org
X-Gm-Message-State: AFuF++krlRV3n5fSw36BOxawPNivKOXhotfRdZ7LxMugjYeV6NEKzbJ9
	qQtjWcrCML1kje3MRoZcD+XC7N5kNsC/7GPqkNcfatcKJxEcEgQpwQ3y7dWoxuW6wECNzdOt0fW
	ScfXhEIw9GV+Ob5rCeCd4/5yNEoNqCrM=
X-Gm-Gg: AYBFou13247yrcy0Ij1UPB4PEEjTlcpRPfcVQClBSCs1yx6SIRWEUxJalddFls4UwGZ
	QnWv0ZwATAOOatU5xaPVGwJsXmGeYJFxPoI0hRV3Ru352BiBLIpIu9zu1sSwx5jhjgiKtWR48k2
	LJzD4KUHzDqmxOOFpNb4GzxM9p/ACmynSSSGdDyEmD4k7iL11Zh+w8YDd/4KcK5hQsTVK5JbuIV
	5KhN2xnAeoX2ucZ69Axm1uftwQGSc6E/KLmg3k9pJh01E6WzJEaXWvExUutlMfd2zgcLmDYEYUi
	YgvhSOgxYv7eoQerqNynXQrFsZm+e0pLj4lP4lgFuRZc16CSjduL05pYN60rjCsH284KN5QMfiW
	kn28=
X-Received: by 2002:a05:6402:43c6:b0:6a0:d411:930d with SMTP id
 4fb4d7f45d1cf-6a60d36c8ddmr8084948a12.2.1788217345227; Mon, 31 Aug 2026
 16:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
 <20260818-ti-am33-usb-v2-3-66fd44d66824@gmail.com> <20260831134643.GA733140-robh@kernel.org>
In-Reply-To: <20260831134643.GA733140-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 1 Sep 2026 04:32:13 +0530
X-Gm-Features: AcwNN1X3HOOhqJKkqX2zS7vFMQd-QWtG1Ec31OOg1tzrgRf7iaa2sG06AC-hKII
Message-ID: <CAOWyW_4RpTD9zAmFDr41sFOj5LtRaGdad7M8QCvQNAQDtamYMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
To: Rob Herring <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Siewior <bigeasy@linutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Ravi B <ravibabu@ti.com>, 
	Kumar Gupta <ajay.gupta@ti.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 18, 2026 at 07:58:45PM +0530, Bhargav Joshi wrote:
> > The am33xx.dtsi defines a single interrupts property for the MUSB nodes=
.
> > Several board-level files override the usb0 node to use
> > interrupts-extended instead to include vbus interrupt.
> >
> > Since both interrupts and interrupts-extended cannot be used
> > simultaneously, Add /delete-property/ interrupts to the overriding
> > nodes to resolve the schema warnings.
>
> Actually, both should be allowed. In theory, an OS version not support
> 'interrupts-extended' and 'interrupts' is also needed for compatibility.
> Though in reality, we've now had 'interrupts-extended' defined for a
> long time. I'll look into what's causing this warning.

Sure will drop this patch in the next version. I also opened pull request t=
o
dt-schema fixing this warning
https://github.com/devicetree-org/dt-schema/pull/206
>
Best Regards,
Bhargav
