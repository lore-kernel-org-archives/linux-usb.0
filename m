Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54713AF2;
	Mon,  2 Mar 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448066; cv=none; b=KYEcZGkmMQLUS+PdYMH/Tk4weEqDm6Qmik3ifXaGJmsWyQgaDEKz/1ttgfbNibQcuq6gUMbrw/V9twU6Jox1WKvUTKcahvrdiRsG70vQENis9A+M/Vn4vjXm6TVytvXl7lu0RdyM0IxiUZFxDCFXmRy/ZOHyHv0Seiud363Cfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448066; c=relaxed/simple;
	bh=fmOaqZzKZxuokX0Nx7UkO3kTPhruVKwQgRYwMInAm1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oz7SrgIbfLkcqB5mfm+O1B1QF3BdGXLfvDsDBuM7zke4TDXK9TCg9+i7E5+6L9KXqcp4kMGmn6q2q0/u0clSIVRVz7ENFPRIrjmfKa2qCjqxv9+VeZojmlV4l30rBAs3kuJrsz/0bDlp2QX0OwWSG7JzOYvfCjU66Wdz6kAcbks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com; spf=fail smtp.mailfrom=linux.intel.com; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linux.intel.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id DFB1E2113E12;
	Mon,  2 Mar 2026 12:35:39 +0200 (EET)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id K8OIgSudRMgB; Mon,  2 Mar 2026 12:35:38 +0200 (EET)
Received: from [10.10.10.2] (82-203-162-4.bb.dnainternet.fi [82.203.162.4])
	by smtp.dnamail.fi (Postfix) with ESMTP id 122D32113E16;
	Mon,  2 Mar 2026 12:35:33 +0200 (EET)
Message-ID: <f3b17482-0358-443b-a8f1-1da3d3b2a4b9@linux.intel.com>
Date: Mon, 2 Mar 2026 12:35:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: hd3ss3220: Add sysfs attribute for USB role
 state
To: Venkata Swamy Kassa <venkatswamy7@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>,
 gregkh@linuxfoundation.org
References: <20260227182454.761925-1-venkata.swamy.kassa@hexagon.com>
Content-Language: en-US
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
In-Reply-To: <20260227182454.761925-1-venkata.swamy.kassa@hexagon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The HD3SS3220 driver correctly detects USB Type-C cable attach/detach
> events and propagates the role to the USB controller. However, there is
> no way for userspace to query the current role state (device/host/none).
> 
> This becomes problematic when using udev rules to trigger scripts on
> role changes. The driver generates kobject change events, but the event
> itself doesn't contain the role information. Userspace needs to read
> the current state to determine the appropriate action.
> 
> Add a 'usb_role' sysfs attribute that exposes the current USB role as
> a string ("device", "host", or "none"). Also ensure sysfs_notify() and
> kobject_uevent() are called when the role changes, enabling userspace
> applications to poll() on the sysfs file or receive udev events.
> 
> This is useful for systems that need to:
> - Start/stop USB gadget functions based on cable connection
> - Switch between host and device modes dynamically
> - Monitor USB Type-C port state from userspace
You use the "data_role" sysfs attribute file for this.

--
heikki
