Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091310;
	b=licZ65B2+0bX4VnqijvuH6O60rJZ2ayPU317ya47gZZowI+tQ5+lmA8hvuwmXcvvOsHR
	 WzEwgsGUPdHGfFhVyvYhDGjGJ8mblgJB2Wq/3Z7bpPr3uKHCsnNgIWXX7ZfAUEX6B6MUO
	 gqObutUDWz5d0+DB5tPgVwPLQpIo7SeypmO8HkE42ZDwpFL5x+OVyaqXQjpttlgj92CKr
	 ltLHS0OK2TA1Qpj+9TelNYwKmYs+8EC8+viimGJVxYCLGP5IbboOfEs3lDafI9U3oUX1y
	 pU9SlbEq/HztWXLPC3gPbKOjHOQGAwQUEST8cwu8Cv9wxPR+PWEEXP4puD8/AZlJKhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091310;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q2+3flLdKkitImz/XEZPl3BJeh/zAmy9i48Y4faWGuE=;
	b=Zi3JpYdrUq8gVwMKvM/M4M1o29McT3ETtQ/104LUd9VDUJVVIqz8k+g32EDWP/R5yRQ+
	 SZUakxVAO561ij7NUQf+XObpbV/I0kii+NWPSO/fjQr5G2xB2vZhmW9nvtUmEwZV7n6m/
	 2I0UTV0yIl+unPgB5+Cr6YicmE/ipnK7pun1YyikYkdnou938+tZrw8iBJ0/JpVVAj9t9
	 7MCDWN5I0SGMErOFBEO4H+ZTSO2gW7+JAm9Wp6w1a8/TwNSam05T9sy5HF06VB1pEqrJl
	 yvKvlZlLTzYaL6mPZR/1T0JWUY2cuoDYITm4q8ec1nyqNHanDFO6ik/yZihlp2mUTFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=T7JqdxRn;
	arc=none smtp.remote-ip=185.70.43.96
Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245BF606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=T7JqdxRn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1795091306; x=1795350506;
	bh=Q2+3flLdKkitImz/XEZPl3BJeh/zAmy9i48Y4faWGuE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=T7JqdxRnr7v5jyWQwUYRxaAiuaTcyJqozNoThFytr/sbdKmd3Gz//m0SZmhsMai77
	 OuiF5f8O+SVZt3ZutGhF+W11GCQFIIZLRy0QO0FthchO2CRfsYCSjU0GmBK8YWspy+
	 Zn+XD5w5I6Fm0yfc2NUl24LjCmzdMvU4bHWVw7w3xOx4cvFOL2YRrhOS2211htxmP9
	 sad0hT+vfufiyh4p/JElVYVnPhsNGuzmMQ7BX6WxODNiciatbwzaTDfz868MzUJs8D
	 5iP1zK2qOLpEANEuiJVw10RuwBaV3Ix/sGqD8vTV+gnoNsos8G1mdakdLP1upFIyEP
	 fRPlAED84fW9w==
Date: Thu, 19 Nov 2026 12:28:24 +0000
To: Oliver Neukum <oneukum@suse.com>
From: Alexandre Becholey <alex@becholey.ch>
Cc: Oliver Neukum <oliver@neukum.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: image: microtek: don't receive REQUEST SENSE data into sense_buffer
Message-ID: <AP57iwtzG1Kr6EB4hY7F0Hd-DaLhPZJzxoKNuvDpeiAKZvyxsddI1fl6kRKAc2Xg1ox0kL-KAdNYmZrRMEYN_mZRamfiV6nXjdcfDhJhGyY=@becholey.ch>
In-Reply-To: <643a71e0-7347-47f3-8cad-ce31f76cb8af@suse.com>
References: <20261119084526.535901-1-alex@becholey.ch> <643a71e0-7347-47f3-8cad-ce31f76cb8af@suse.com>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: f481e75571a0ab0fcd499d96fddf34996bd4e000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, November 19th, 2026 at 1:02 PM, Oliver Neukum <oneukum@suse.co=
m> wrote:

> On 19.11.26 09:45, Alexandre Becholey wrote:
>=20
> > The special case is not needed: for the error handler's own REQUEST
> > SENSE, scsi_eh_prep_cmnd() already points the data buffer at
> > sense_buffer with at most SCSI_SENSE_BUFFERSIZE. Handle REQUEST SENSE
> > like every other data-in command.
> Hi,
>=20
> thank you for looking at this, but this fix seems to not take an
> approach I can approve. Where sense_buffer is pointed to is
> internal to the SCSI layer. We cannot use that in an LLD.
>=20
> If you think that LLDs should not use sense_buffer then the clean
> solution is to remove it from struct scsi_cmnd.
>=20
> =09Regards
> =09=09Oliver
>=20
> NACKED-BY: Oliver Neukum <oneukum@suse.com>
>=20
Hi Oliver,

Would you take a v2 that keeps receiving the REQUEST SENSE data into
sense_buffer and only limits the transfer to SCSI_SENSE_BUFFERSIZE?

        if (context->srb->cmnd[0] =3D=3D REQUEST_SENSE) {
                mts_int_submit_urb(transfer,
                                   context->data_pipe,
                                   context->srb->sense_buffer,
                                   min_t(unsigned int, context->data_length=
,
                                         SCSI_SENSE_BUFFERSIZE),
                                   mts_data_done);

The device can then no longer write past the 96-byte buffer, and
nothing else changes.

Kind regards,
Alexandre
