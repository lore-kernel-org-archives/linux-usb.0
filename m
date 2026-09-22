Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F65616BC
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 17:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098525; cv=pass; b=UcyA7tXz91wgHs8VFu2QjS3s770w/3fCivHoJi5p5NwJaDDUn1XkdKTt1JCnKOwM27BcM1nHLPrQK5jqafLXHYquF5bdUxvDLhA0qku2yV40UCuREXzbRUEZWblFZtmrEWLu4mb63+Dyde3PKoTRzHoG4gzGC45HcsenFyYubCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098525; c=relaxed/simple;
	bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvd7lNKh8fZhBEEL5xWPc0MugoY2LlVvm6Jd//PQqy5NkwXN40qXLLDeQiSglHS4ecvpmiFyzgI4MRpO2tWkGX5nHLPzdSUGPX5kMpIdYlkHcl+Js6UrHSOH1oXOHTY8x9nK+YpGjsTDA6WUS6O3lZ/EQH5X0RDaIVBI+jS10Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sht/v/sA; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sht/v/sA"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8e6bbso47513d50.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 10:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790098523; cv=none;
        d=google.com; s=arc-20260327;
        b=Qt3mueNkYsVpWgfBZk1AvUqaLSEza/siV0/Xrg+OcoQKQ4NwRYdvAXARbNb7rTqm6J
         BBE6g4ki6p7+o+VwkAVgYb+MRwJNpi+67I8KHqQGhxXUEUJ8ps+1ieo+EOOELviT45si
         2+KY34aNnGpd2DKbcisaPTUAMrKpqOHOrM165kuxi81MQrgIz8JTnNu+gjwQigYFO46M
         BLP7SlPkRQ4WG0IgJntZQnyE+K8LVEdBkOqHKkRGq7wMbvFAnr/bt8erQ55sMEmREumS
         gMsC+QucKzPUrpJPyW26Px7O7hWNE36a9vFvtLaqygec7X4zFRvrlVouLMmbSjW2tj1B
         /lWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
        fh=3a0G1/KdzgGwqfyao1PDddVUGa/ZQkbykwR/QxdyJoE=;
        b=d3u4mrfZKCkxt8nZsYcPA6ljYU5Yz3uzISd2rX2TY7bScpgmBcGLfztnkNsHRaRnRR
         0crhecxwyuQ4Uewgo9x/np51LV5xgLUMloYymtTKY65msobh7W9unWZrIPmuCskEFzDq
         Ns04jtYJL2yKGMKVJxLXeuri3JWSk6JVF+2eX2v+B70sX46wULYWdaHypREDvAE0uWgn
         FAKuk3d7D3MmQa2SslBOfYFbuOukWqwxSlmEK0Nd4ylp6hGo52nTjMEUgVkNq2Arx9mb
         EMm8gFWmjqYyGrUXsMMURzYQuhcuOhPsvR7I3hFsjojBtv1z2XnYfExrkvD8c9bdxzI1
         0oxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098523; x=1790703323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
        b=Sht/v/sAfrRUN37eKKEoWQnMh7XIB1+dKe/SsTHaSyqNqjr2L4GdSFL9GF2IqlSkH+
         PDFcmzy11pPwpg6GvekBFullqKnaaRie4n9V86ZktrpY3umfpiS7n3JhynAgvOqrgKb+
         3o1jpVdF1OKJec/94PDhgPAsBPe+UUBc19lXADhhXWgTKIEyDpmXXg56MtCO6XIGxE7s
         Ve0pQ0A+7zkWr0d84YavRTNs9EObeQ7oHNNwgdlnh9U32OEWQ3E8f1R2jj8T8sX2Wdlp
         kE2IAadQy0HhPvrGtpYxt1K6Zb3LLeRk5XCihwnGnt/ZG7/Wbmg3oTcg+Vkzx4ljoljd
         F4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098523; x=1790703323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1YIIZbfM4YiwXaaCLt7e93dmE/7tvFPjqo3z+Kmpt0s=;
        b=fo1pHd3KHSYpoKhWX1iOuca14nXTPJjTDHARe/BfiC2Yslb8EnBUGS+hyx6QUCtn3C
         YxAF3iqBbkYK1Ts+k9RGNDhXlgBpZa6RXMvmL6H4a6aNlohJaLmZYDuSPcYP7dXdBj4x
         RNMht1/sEeiFL/q6Ga04ppm7Xn41ZgOmJkPkjDnzJ20AsRNr54xWtpG0eOZ4GSs0fqd/
         MTM/uYAfa/rFAnXD/V9RHw7HxfSn8PwhVb3JDKvPw+yqHDCh9ROY3MbcAbMOxbzmGksq
         3bCbqTv8KMEJtGEskGesm2sbBRhR32T/vvLfir51ZzfbZuxN6orj6u706KnU9Wo0MuzI
         oerQ==
X-Forwarded-Encrypted: i=1; AKwUvByEvWelpw5Kkde12vvEKbNQaup3NJ7BVBPYmb67w7vYSr8Zr+3ZztebyW/6aLWz3jEzraC3aB5MAyM=@vger.kernel.org
X-Gm-Message-State: AFuF++lUICM7YgeHdAsBVJw1FBILRACg+Fjaj07wkHmoLWB+KoJ08hgp
	BlJ7+jx/sXllJe2V6ZFitJ8Gl8l5w4ILduCUom0YQK/bJ7fDlzY3vEj/0MS8NPurhdEvcuC+rls
	FhebOjLWCgO027l603sjn9lw8v5MBDb8=
X-Gm-Gg: AYBFou3Azh+UNM2V7MXl4eErnsq6OInY5k5VZ8NIjGQMHl6jUP6awKLeKf/sfc+B/iS
	6LPignkbryO8kizgaRfPo4a+BN0O14XFJesaif+q4paUeEixiaLzxTzah9JApBLzCrI2rR01R8s
	hyDdodr7vEW0vjOsdbxASM9yi3q7kFtBrS7KhsmqUzbib+hIZAHh3Ly6YYGp0m5OPtHexr8ORsP
	vtGMj+/7wOvv35h2x3HQQ+BLvbYEi882MZYQbK0Ui8FwaKF1Ko3jzXG46mYYC8WFYE4L7x0UgYl
	UcCo+Z9c7ocs+Vxq9xAfuBgA9I41+MwUKgBp5+YP1Gzt6GAYKUKfPaMw2eTyPKBIfHN0ENqUQGf
	4cik94TeZoEhb
X-Received: by 2002:a05:690e:e8f:b0:671:28df:a073 with SMTP id
 956f58d0204a3-672d58a9a54mr129200d50.14.1790098523090; Tue, 22 Sep 2026
 10:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920212934.392398-2-eeodqql09@gmail.com> <arJjO3riWgdVKt0U@black.igk.intel.com>
In-Reply-To: <arJjO3riWgdVKt0U@black.igk.intel.com>
From: Seungjin Bae <eeodqql09@gmail.com>
Date: Tue, 22 Sep 2026 13:34:46 -0400
X-Gm-Features: AcwNN1UCk-bBKt_uB2kuYcZOnGQTcRpVj0NXGR-pjiW13Mcc-b9T2IadVnIwgCs
Message-ID: <CAAsoPpX1NgzMKJrvTdNp0heM0AMQAT0_t_2+AJdZs5fsZNpLOQ@mail.gmail.com>
Subject: Re: usb: typec: tcpm: type-mismatched PDO handling in tcpm_pd_build_request()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Li Jun <jun.li@nxp.com>, Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, 
	RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 7:15, H=
eikki Krogerus
<heikki.krogerus@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> +Badhri, and also RD and Amit
>
> On Sun, Sep 20, 2026 at 05:29:35PM -0400, Seungjin Bae wrote:
> > Hi,
> >
> > I found that tcpm_pd_select_pdo() can match a source and sink PDO of
> > different types. Before sending a fix, I would like to ask whether
> > this type-mixed match is intended, and if not, whether you would
> > prefer a same-type check in tcpm_pd_select_pdo() or explicit type
> > handling in tcpm_pd_build_request().
>
> I think a patch would have been fine. You can always mark it as RFC if
> uncertain.

Thanks, I'll send it as an RFC patch.

Seungjin Bae

>
> Thanks,
>
> > The tcpm_pd_select_pdo() function matches a source PDO against a sink
> > PDO using their voltage ranges only, without checking that the two
> > PDOs are of the same type. A source PDO and a sink PDO of different
> > types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
> > be matched as long as their voltage ranges overlap.
> >
> > tcpm_pd_build_request() then combines the matched pair with
> > min_power()/min_current(), which apply the same accessor to both
> > operands. pdo_max_current() and pdo_max_power() decode the same bits
> > (9:0) of the PDO but scale them differently (x10 mA vs x250 mW), so
> > when the matched types differ, the sink operand is decoded with the
> > wrong accessor. This misreads the sink's capability and weakens the
> > min() bound intended to cap the request to the sink's limit.
> >
> > This type-mixed match became possible after commit 53fe0de9a35d
> > ("usb: typec: tcpm: pdo matching optimization") relaxed the match to
> > voltage range only; the min_power()/min_current() macros still assume
> > a matched pair shares the same type.
> >
> > I have not observed this on real hardware; I found it by static
> > analysis.
>
> --
> heikki
