Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691600;
	b=5JbmetlM0z0Hdoy8/4OOa8/9I+dt5roPae5JQ6/+07YLlgDBdIfEMOEV+waSsrCreiH6
	 MvTFZMTrUvAM+A09xZ/4NCW9rSb7PGhVCihnt7F11Yz4bxC267tzNEsgS+Vuj1ucTA7GY
	 qpUZSkcQt2JLfaR2jOufFegKuPsXoMLtrfvhLgtqeUo1B36pMQeZPMh9MbDLFWQ9yFW8n
	 rlWDkiDEO0bgK8jLH7i1CZbp2bmDrFB++FIax7z9Q/4fOULN3h5YLyFL7TB8qA0tiYHrp
	 NYc/BNr1Djho3hjl/Pfh5l4yathy+4Sn0VOozMv1R/YEw9u5aVMdO/PmC637CIO020Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MY1VeJ8mIsI160dpveus44F/KNQq5wwKZKmiVgK+GP8=;
	b=imLx+To/yD5NspsxYHgcopsQvkpj5Zw4oZlVCko9Y9YdztgYgn397G0fiMK9j0Yse0X9
	 isxS69IlUzFKuN6XpYCb1XqxNQ85pXh6opC1T3yCtfF490yYBY/Vjzt8kZld2mZ3/4rNe
	 P6+o0t3Isd1n3vWlWZLw4o3wn1WupCvFpUyEbnzoXjwu3yOZzxasToturq3HMo/xxyPG7
	 7OxLAKN4QjczVNS50Emro/GYfXsLCWmk/YGR9DrLUBYz9KJrnOLgp7+Rmw1eiuAkH2bba
	 o7YVgxbp+jTmyo54BLhR/FjFRCo2fqCsUaRDE7rFtn8CmQ91vMN6BcmJst0sK3eae2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="K4cyE/4V";
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88392606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 17:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88392606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=K4cyE/4V
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f1e5d7450so1558485a.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 10:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792691598; x=1793296398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MY1VeJ8mIsI160dpveus44F/KNQq5wwKZKmiVgK+GP8=;
        b=K4cyE/4VXhnaEdOsY17LqTACCIdYiMLXGnf2MWGMPbl+Bmjp6iCs9EKq9ydf11JVhR
         c3FD73FPMf6uahMrLx4e9y7aPxVPOanFqStVVVPIKjrS4dVwFW44kF7FLwiq8WwSSt50
         AC+LuZe4gyX7IaEIFW9/drAzvCDaNc7h8JlMYIJJkE+5xrLws/U0NOEedvRbyyOG9M2C
         077ZMPa+9VctmvF3d2eJAhT3OXJSe59BfQILJmQyz8sF8vsuSRAAhzXrGjQYNiruTn+w
         Y1yWSd9ojQCW8BjFmAjA7CMo6c3VKu+yZokiM5ZjunvJIiMbeAS/3VoJXP3/unxJCi9s
         kH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691598; x=1793296398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MY1VeJ8mIsI160dpveus44F/KNQq5wwKZKmiVgK+GP8=;
        b=HmcV5Ii/KJLUN+rM3WE7UUMd/ddlRAlsO5oIKIEbj/w0uvX4yys63Dc8MJW0pQlRXz
         0nrIrEd0GLiK+OUNt7sVSb5AM7R/ge/BHGHJ3Vxn8jlhgU4rj841zxXNRf4YAsOYj0zA
         9xh+flUIjUHMgu53y0OcOZ5JOPUb0nj3f7q+F0diqdAO4kfrCOXE/QHvQj+WpVRQnl5l
         teEkoXtklK7FK1vjbSgaqUNl6fsj0kJ/MJUk5ERl0uhX8Uopo5oVuVH7dm7QZUdrRhQY
         j3+lnHp9VsUnkIBaCxTuGii8aoQRXKJnUOE5//d8MBeRWBB1qheL/6ktsXLTmpcI6Z6T
         e8rw==
X-Gm-Message-State: AFq9FYLtTH7SIPGWfVLaf51eK5N3oiR/idFn6wgTRfwCtvN1vOBNXm+K
	3iFvBausMaR819txSUkXnStU1CTtgkHUcoTyd2j3a9wO0YxwIjFGK9iUCleHL7nEcw==
X-Gm-Gg: AYBFou2nrkM117+K1DodY+Iz0mvTCZURhi4sRDAOdWQC/RAdugd1hViudOy+xlD12kL
	O6fSBVw/WKy6h9vvyWOfErrypkQBw/EgY+YhVscYv879ujIN6ZR61nTN7CEPPjzi0tVDhwZZMns
	pXY6VN32HoOVYDqnaXZSaWechuLI3N+EpRHKPrdJBRdp5ePKMHcCts7iVCy3oj6DA48TUdca1Sk
	+KL3QRmLPQldV4DJYEMpp2jCFGx2KfOo3zgZSFOc8Ipljxj/nfAvXBiJ6VeNhVmdjhas6dIFq5o
	2qbrFwgN7DjJEW85ehVEdCiTuG2DJmfB/CqR5H387ZkUBGQI2eGa8vymo/shzzCCXxdYp6QXOa/
	TLUz4J9p9CGQ6l47ZFqyMC+NV43UHnrp23BRKWf/99589teh5gxAMEw77JXZdQlcfYxMFfCzrC7
	UjCgNHbTtS5m7IqDiKz61egW0QPBRdUYMkMLcKl4pZ4aNB7TDaV7vcjvsuDf//VeI6FD1HpCJ4Y
	wYmOTM7JFKyo88mo/T6vwR1DLMi4KATz1JPiDpkTs2PYHzEEkrDp3zlrMeV3l5cC4PgKQiC4V7x
	ib2QAyKYNEaCRnqaktMR/xs=
X-Received: by 2002:a05:620a:8084:b0:93f:16d4:3bf0 with SMTP id af79cd13be357-93f6f82da2bmr31159285a.42.1792691598291;
        Thu, 22 Oct 2026 10:53:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c370549f5sm2970696d6.21.2026.10.22.10.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:53:17 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:53:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: Linux USB threat-model document
Message-ID: <ee2bf5f9-9bb8-434c-86af-a211065c6e2d@rowland.harvard.edu>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
 <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
 <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
 <2026022617-disengage-spinning-c6bd@gregkh>
 <7480e993-b873-4ea4-ac6e-45bd22975f8a@rowland.harvard.edu>
 <2026102125-guide-slam-e2be@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026102125-guide-slam-e2be@gregkh>

On Wed, Oct 21, 2026 at 08:26:12PM +0200, Greg KH wrote:
> On Wed, Oct 21, 2026 at 12:53:03PM -0400, Alan Stern wrote:
> > On Thu, Feb 26, 2026 at 08:29:45PM -0800, Greg KH wrote:
> > > Given that I have to answer this type of question about every other week
> > > these days given the fuzzing reports we get sent to the
> > > security@kernel.org alias, I think I need to just write up a "here is
> > > the Linux USB threat model that we currently support" document to
> > > describe what the state is.
> > > 
> > > We can then work from there, either agreeing that we need to "move" the
> > > level of interaction for which we trust / do not trust a device in the
> > > lifecycle of a USB device, or just be happy with where it currently is.
> > > 
> > > That should work better with some groups that I know are working to do
> > > stuff to "harden" the USB device stack for some specific use cases,
> > > hopefully just using the existing user api that we have today that
> > > USBGuard uses, or possibly adding to that to handle some missing areas
> > > that we have not previously considered.
> > 
> > Did you ever make any progress on writing up this document?
> 
> No, been swamped by the exponental increase in stable and CVE work :(
> 
> > Have these outside groups gotten anywhere, or identified anything that 
> > the kernel should do differently?
> 
> Yes, there was a presentation at the Plumbers conference in the Android
> track about this and what the Android people would like to see be done
> differently in order to make this into a more secure type of a system.
> The slides for that should be online somewhere and the developers there
> said they would be sending patches to the list for review "sometime" in
> the future.  Right now I think they have a long way to go before that
> happens, but at least they are thinking about it.

For those interested, I believe the presentation and document Greg was 
referring to are available here:

https://lpc.events/event/20/contributions/2559/

https://lpc.events/event/20/contributions/2559/attachments/2030/4568/LPC26%20-%20Modernizing%20Android%20USB.pdf

They're talking about some pretty big changes.

Alan Stern
