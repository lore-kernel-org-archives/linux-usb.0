Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CCA33F383;
	Thu, 12 Mar 2026 02:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284370; cv=none; b=otziKuLAO0JDdK5lD/TvmbIyz3K29ciKVQ/AL/z5vy26oGSWFO8UkstRQW2Fc2OrWCpGtLVI3zxjKs2HNEenW8aAITykrKWmzQOHeNC/4v2zre04XKHTkUXNu1bi46C/QTgLPCcM49zLk8/erHNfMK5m22ye2cmTmouSuCaKR3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284370; c=relaxed/simple;
	bh=E4F4oRB4bIjXP+Rvzu6quj6jj9n23SFkD4aJtqjacaE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ft0HIVGqDxQbMdq1ADwmVyf7nqJvfLQqPQdFki6omlGOKFQQJIdyWlwDoij5BzEBnvh165aBilvqMN5glhK8GyC8G00qEDgJi2yO/rOVtKYs12FeQsPzhez5qvmwCv+ckXWUlRE4GE06KBx2Vk820xs1ZkGNIE793rSLy5kJR9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=CK4cCD3I; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="CK4cCD3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773284366; x=1773543566;
	bh=cY5yIwTTANhf0ZaEkdOQp3wtgZJLoLIijH3LqL+zf+s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CK4cCD3IS1fFuPCwj93eZx7CvY5yc/4oy6RLW6NWFgkxkKFEq9c5TYvhCx0SY5B7r
	 FI/JFSk9dT6947XaXd2fzwmSrN+iuFHNaKnWAHvZ3LRQoszLTDoO3t/nM1KynW6d+T
	 BNN/2i2tSUGXxBv2VXbWWAYSjagKIJM6+8wB0RLbbwp2YhZBs4cPKm29JeJT0Pb8A2
	 4rrgpUDJ60XQ+HjCXLFq57Q3IoxKhC9W2Txk9g0p0zaGKgOZa0+nJTA73OZimGDwWa
	 6/VvthM2i5mJJYbT37h/PdAwUcB35jLTov/ci3wzIsmksG0dEVUwXE2SKcLz9+PUyD
	 hiW1AZpTPnELQ==
Date: Thu, 12 Mar 2026 02:59:21 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document vbus-detect-gpios property
Message-ID: <5ZThs21yPOC183UvNzHZU9U0iOt5GIjsRC75wOLXfzcmqAKLmsRhemi7xlFz_xLyhsWDI2D90fpeBhB2CV2pXjR_nzK_Rsyc51PQOe0m1H0=@pm.me>
In-Reply-To: <m326m6tjiiatutb3s7jhr472grmlvkbg25cqf5gijusioaszxm@6bkxef6s3pyy>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me> <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me> <m326m6tjiiatutb3s7jhr472grmlvkbg25cqf5gijusioaszxm@6bkxef6s3pyy>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9bb284d9461966e2782d3f3995110f9115e303cf
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 11th, 2026 at 10:34 PM, Dmitry Baryshkov <dmitry.barysh=
kov@oss.qualcomm.com> wrote:

> On Sun, Mar 08, 2026 at 11:20:27PM +0000, Alexander Koskovich wrote:
> > Add the optional vbus-detect-gpios property for devices where the PMIC'=
s
> > built-in VBUS detection is unreliable.
> >
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml=
 b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > index 6d3fa2bc9cee..f45bf3e34c03 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> > @@ -78,6 +78,12 @@ properties:
> >        - const: msg-rx-discarded
> >        - const: fr-swap
> >
> > +  vbus-detect-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO used to detect VBUS presence when the PMIC's built-in VBUS
> > +      detection is unreliable.
>=20
> Can we use vbus-gpios from the usb-connector instead?

Didn't see that! Yes definitely, will update v2 to use that instead.

>=20
> > +
> >    vdd-vbus-supply:
> >      description: VBUS power supply.
> >
> >
> > --
> > 2.53.0
> >
> >
>=20
> --
> With best wishes
> Dmitry
>=20

Thanks,
Alex
